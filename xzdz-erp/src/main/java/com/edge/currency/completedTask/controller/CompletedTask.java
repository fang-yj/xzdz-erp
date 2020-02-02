package com.edge.currency.completedTask.controller;

import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edge.admin.company.entity.ERP_Our_Unit;
import com.edge.admin.company.service.inter.CompanyService;
import com.edge.admin.customer.entity.ERP_Customer;
import com.edge.admin.customer.service.inter.CustomerService;
import com.edge.admin.user.service.inter.ERP_UserService;
import com.edge.business.sale.entity.ERP_Sales_Contract;
import com.edge.business.sale.entity.ERP_Sales_Contract_Order;
import com.edge.business.sale.service.inter.ERP_Sales_ContractService;
import com.edge.business.sale.service.inter.ERP_Sales_Contract_OrderService;
import com.edge.currency.alreadyTask.entity.AlreadyTask;
import com.edge.currency.alreadyTask.entity.AlreadyTask_QueryVo;
import com.edge.currency.alreadyTask.service.inter.AlreadyTaskService;
import com.edge.currency.completedTask.service.inter.CompletedTaskService;
import com.edge.currency.reviewOpinion.entity.SYS_WorkFlow_PingShenYJ;
import com.edge.currency.reviewOpinion.service.inter.PingShenYJService;
import com.google.gson.Gson;

/**
 * 已完成控制跳转层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "completed")
public class CompletedTask {
	@Resource
	private CompletedTaskService completedTaskService;

	@Resource
	private ERP_UserService userService;

	@Resource
	private ERP_Sales_ContractService contractService;

	@Resource
	private AlreadyTaskService alreadyTaskService;

	@Resource
	private CompanyService companyService;

	@Resource
	private CustomerService customerService;

	@Resource
	private ERP_Sales_Contract_OrderService orderService;

	@Resource
	private PingShenYJService pingShenYJService;

	@Resource
	private RepositoryService repositoryService;

	@Resource
	private HistoryService historyService;

	@Resource
	private RuntimeService runtimeService;

	@RequestMapping(value = "/completedTask.do")
	@ResponseBody
	public String completedTask(Integer page, Integer limit) {
		// new出AlreadyTask_QueryVo查询对象
		AlreadyTask_QueryVo vo = new AlreadyTask_QueryVo();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		vo.setPage((page - 1) * limit + 1);
		vo.setRows(page * limit);
		// 总页数
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", completedTaskService.CompletedTaskCount());
		List<AlreadyTask> allTaskList = completedTaskService.CompletedTask(vo);
		// 遍历该集合 设置已办集合
		for (AlreadyTask a : allTaskList) {
			// 取得businesskey
			String businesskey = a.getBUSINESS_KEY_();
			String id = businesskey.substring(businesskey.indexOf(".") + 1);
			//任务办理人
			a.setUserName(userService.queryUserById(Integer.parseInt(a.getASSIGNEE_())).getUserName());
			// 任务发起人
			a.setCreateUser(userService.queryUserById(Integer.parseInt(a.getCREATE_USER_())).getUserName());
			// 得到业务数据类型
			String object = businesskey.substring(0, businesskey.indexOf("."));
			// 得到开始状态的任务
			AlreadyTask task = completedTaskService.queryBeginCompletedTask(a.getPROC_INST_ID_());
			// 设置开始时间
			a.setSTART_TIME_(task.getSTART_TIME_());
			if ("ERP_Sales_Contract".equals(object)) {// 表示业务流程（销售订单）
				// 获得ERP_Sales_Contract对象
				ERP_Sales_Contract sales = contractService.queryContractById(Integer.parseInt(id));
				if (sales != null) {
					// 获得任务描述 设置待办任务描述
					String taskDecription = "【" + a.getNAME_() + "】" + "  " + sales.getTask_Describe();
					a.setTaskDecription(taskDecription);
				}
			}
		}
		map.put("data", allTaskList);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 点击已完成列表进入相应的查看页进行查看
	@RequestMapping(value = "/completedTaskInfor.do")
	@ResponseBody
	public String completedTaskInfor(@RequestParam Integer id, Model model) {
		AlreadyTask alreadyTask = alreadyTaskService.queryAlreadyTaskById(id);
		String businessKey = alreadyTask.getBUSINESS_KEY_();
		String obj = businessKey.substring(0, businessKey.indexOf("."));
		String objId = businessKey.substring(businessKey.indexOf(".") + 1, businessKey.length());
		// 加载批注信息
		List<SYS_WorkFlow_PingShenYJ> psyjList = pingShenYJService.psyjList(alreadyTask.getPROC_INST_ID_());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:dd");// 设置日期格式
		for (SYS_WorkFlow_PingShenYJ p : psyjList) {
			p.setUserName(userService.queryUserById(p.getUSER_ID_()).getUserName());
			p.setTime(sdf.format(p.getTIME_()));
		}
		if ("ERP_Sales_Contract".equals(obj)) {
			ERP_Sales_Contract contract = contractService.queryContractById(Integer.parseInt(objId));
			// 获得供方对象
			ERP_Our_Unit our_Unit = companyService.queryUnitById(contract.getSupplier());
			// 获得需求方对象
			ERP_Customer customer = customerService.queryCustomerById(contract.getCustomer());
			// 获得销售合同货物清单对象
			List<ERP_Sales_Contract_Order> orderList = orderService.orderList(contract.getSales_Contract_Id());
			model.addAttribute("contract", contract);
			model.addAttribute("our_Unit", our_Unit);
			model.addAttribute("customer", customer);
			model.addAttribute("orderList", orderList);
			model.addAttribute("qdrq", sdf.format(contract.getQd_Date()));
			model.addAttribute("OBJDM", businessKey);
			model.addAttribute("reviewOpinions", psyjList);
			model.addAttribute("processInstanceId", alreadyTask.getPROC_INST_ID_());
			return "business/sale/saleShow";
		} else {
			return null;
		}
	}
}