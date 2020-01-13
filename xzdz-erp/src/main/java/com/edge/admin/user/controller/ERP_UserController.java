package com.edge.admin.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.admin.department.entity.ERP_Department;
import com.edge.admin.department.service.inter.ERP_DepartmentService;
import com.edge.admin.post.entity.ERP_DM_Post;
import com.edge.admin.post.service.inter.PostService;
import com.edge.admin.user.entity.ERP_User;
import com.edge.admin.user.entity.User_QueryVo;
import com.edge.admin.user.service.inter.ERP_UserService;
import com.edge.utils.EmailUtil;
import com.google.gson.Gson;

/**
 * 用户控制跳转层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "user")
public class ERP_UserController {
	@Resource
	private ERP_UserService erp_UserService;

	@Resource
	private ERP_DepartmentService erp_DepartmentService;

	@Resource
	private PostService postService;

	// 跳转至用户列表页面
	@RequestMapping(value = "/initUserList.do")
	public String initUserList() {
		return "admin/user/userList";
	}

	// easyUI 用户列表查询
	@RequestMapping(value = "/userList.do")
	@ResponseBody
	public String userList(@RequestParam Integer page, Integer rows, String userName, String gender, Integer department,
			String zw, String sjh, String yx, String xl, String beginTime, String endTime) {
		// new出查询对象
		User_QueryVo vo = new User_QueryVo();
		Gson gson = new Gson();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		vo.setPage((page - 1) * 10);
		vo.setRows(rows);
		if (userName != null && userName != "") {
			vo.setUserName(userName.trim());
		}
		if (gender != null && gender != "") {
			vo.setGender(gender.trim());
		}
		if (department != null) {
			vo.setDepartment(department);
		}
		if (zw != null && zw != "") {
			vo.setZw(zw);
		}
		if (sjh != null && sjh != "") {
			vo.setSjh(sjh);
		}
		if (yx != null && yx != "") {
			vo.setYx(yx);
		}
		if (xl != null && xl != "") {
			vo.setXl(xl);
		}
		if (beginTime != null && beginTime != "") {
			// 将String类型转换为Date类型
			try {
				vo.setDate(sdf.parse(beginTime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (endTime != null && endTime != "") {
			try {
				vo.setDate2(sdf.parse(endTime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		List<ERP_User> userList = erp_UserService.userList(vo);
		for (ERP_User u : userList) {
			// 设置部门名称
			if (u.getDep_Id() != null) {
				ERP_Department d = erp_DepartmentService.queryDepById(u.getDep_Id());
				u.setDep_Name(d.getDep_Name());
			}
			// 设置岗位名称
			if (u.getPost_Id() != null) {
				ERP_DM_Post post = postService.queryPostById(u.getPost_Id());
				u.setPost_Name(post.getPost_Name());
			}
		}
		map.put("total", erp_UserService.userCount(vo));
		map.put("rows", userList);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至用户新增页面
	@RequestMapping(value = "/initSaveUser.do")
	public String initSaveUser() {
		return "admin/user/saveUser";
	}

	// 新增用户
	@RequestMapping(value = "/saveUser.do")
	public String saveUser(ERP_User user, Model model) {
		user.setFlag(false);
		erp_UserService.saveUser(user);
		model.addAttribute("flag", true);
		return "admin/user/saveUser";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditUser.do")
	public String initEditUser(@RequestParam Integer userId, Model model) {
		// 根据Id获得用户对象
		ERP_User user = erp_UserService.queryUserById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		if (user != null) {
			model.addAttribute("user", user);
			model.addAttribute("user_brithday", sdf.format(user.getBirthday()));
		}

		return "admin/user/editUser";
	}

	// 编辑操作
	@RequestMapping(value = "/editUser.do")
	public String editUser(ERP_User user, Model model) {
		erp_UserService.editUser(user);
		model.addAttribute("flag", true);
		return "admin/user/editUser";
	}

	// 删除操作(禁用)
	@RequestMapping(value = "/deleteUser.do")
	@ResponseBody
	public String deleteUser(Integer userId) {
		JSONObject jsonObject = new JSONObject();
		// 根据Id获得用户对象
		ERP_User user = erp_UserService.queryUserById(userId);
		user.setFlag(true);
		erp_UserService.deleteUserById(user);
		jsonObject.put("flag", true);
		return jsonObject.toJSONString();
	}

	// 批量删除
	@RequestMapping(value = "/batchDeleteUser.do")
	@ResponseBody
	public String batchDeleteUser(String ids) {
		JSONObject jsonObject = new JSONObject();
		// 将ids拆分为字符组
		String[] userIds = ids.split(",");
		// 遍历该数组
		for (String id : userIds) {
			// 根据Id获得用户对象
			ERP_User user = erp_UserService.queryUserById(Integer.parseInt(id.trim()));
			user.setFlag(true);
			// 进行删除
			erp_UserService.deleteUserById(user);
		}
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 重置密码发送邮件通知
	@RequestMapping(value = "/resertPassword.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sendMessage(@RequestParam Integer user_id) {
		JSONObject jsonObject = new JSONObject();
		// 根据Id查询用户
		ERP_User user = erp_UserService.queryUserById(user_id);
		String resertPassword = "重置密码";
		String newPassword = "000000";
		String text = "<h4>尊敬的用户" + user.getUserName() + ":<h4>" + "<p>您好！</p>"
				+ "<p>您当前的密码已被管理员重置为:<span style='color:red;' font-size:20px;>" + newPassword.trim() + "</span></p>"
				+ "<p>您可输入以上密码登录ERP企业资源平台去修改密码。</p>" + "<p></p>"
				+ "<hr style=\" height:2px;border:none;border-top:2px;width:250px;text-align:left;margin-left:0\" />"
				+ "<p></p>" + "<p>12121</p>" + "<p>网址：http://www.tlxzkj.com</p>" + "<p>电话：0562-2196708</p>";
		try {
			EmailUtil.sendMessage(user.getEmail(), resertPassword, text);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		user.setPassword((newPassword.trim()));
		erp_UserService.editUser(user);
		jsonObject.put("flag", "success");
		return jsonObject.toString();
	}

	// 加载所有未删除的岗位
	@RequestMapping(value = "/postList.do")
	@ResponseBody
	public String postList() {
		JSONArray jsonArray = new JSONArray();
		List<ERP_DM_Post> postList = erp_UserService.postList();
		for (ERP_DM_Post p : postList) {
			jsonArray.add(p);
		}
		return jsonArray.toString();
	}

	// 加载所有未删除的部门
	@RequestMapping(value = "/depList.do")
	@ResponseBody
	public String depList() {
		JSONArray jsonArray = new JSONArray();
		List<ERP_Department> depList = erp_UserService.depList();
		for (ERP_Department d : depList) {
			jsonArray.add(d);
		}
		return jsonArray.toString();
	}

	// 新增用户时登录名检测
	@RequestMapping(value = "/checkLoginName.do")
	@ResponseBody
	public String checkLoginName(String loginName) {
		JSONObject jsonObject = new JSONObject();
		ERP_User user = erp_UserService.checkLoginName(loginName.trim());
		// 如果user为空,则表示可用,否则用户存在登录名不可用
		if (user != null) {
			jsonObject.put("flag", false);
		} else {
			jsonObject.put("flag", true);
		}
		return jsonObject.toString();
	}

}