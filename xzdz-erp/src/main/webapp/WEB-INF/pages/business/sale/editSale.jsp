<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>编辑销售合同</title>
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body style="width:100%;padding:0px; margin:0px;text-align: center;" onload="refreshAndClose()">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value=""/>' method="post"  enctype="multipart/form-data">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" value="${orderList.size()}" id="khlxrSize">
			<input type="hidden" id="flag" value="${flag}">
			<input type="hidden" value="${contract.customer}" id="xfdw">
			<input type="hidden" id="sales_Contract_Id" value="${contract.sales_Contract_Id}">
			<input type="hidden" id="supplier" name="supplier">
			<input type="hidden" id="fjsx" name="fjsx">
			<input type="hidden" value="${taskId}" id="taskId">
			<input type="hidden" value="${contract.approvalDm }" id="approvalDm"> 
			<input type="hidden" value="${contract.task_Describe}" id="task_Describe">	
				
			<div class="layui-form-item" style="margin-top: 3%;">
			    <label class="layui-form-label" style="width: 148px;">合同名称</label>
			    <div class="layui-input-block">
			      <input type="text" id="sales_Contract_Name" lay-verify="sales_Contract_Name" autocomplete="off" placeholder="合同名称" class="layui-input" style="width:72%" value="${contract.sales_Contract_Name}">
			    </div>
			</div>
			
			<div class="layui-form-item">
			     <div class="layui-inline" style="top:9px;left: -280px;">
				      <label class="layui-form-label" style="width:150px;">供货单位</label>
				      <div class="layui-input-inline">
				        <input type="text"  id="ghdw" lay-verify="ghdw" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${our_Unit.unit_Name}">
				      </div>
			     </div>
			     
			      <div class="layui-inline" style="top:9px;left: -80px;">
				      <label class="layui-form-label" style="width:150px;">合同编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="contract_Code" id="contract_Code" lay-verify="contract_Code" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${contract.contract_Code}">
				      </div>
			     </div>
			 </div>
			 
			 <div class="layui-form-item">
			     <div class="layui-inline" style="left: -215px;">
				  	<label class="layui-form-label" style="width:100px;">需方单位</label>
					<div class="layui-input-inline" style="text-align: left;width: 280px;">
						<select name="customer" id="customer" lay-filter="customer" lay-verify="customer">
							<option value="" selected="selected">请选择需方单位</option>
						</select>
					</div>
				 </div>
			     
			      <div class="layui-inline" style="left: -95px;">
				      <label class="layui-form-label" style="width: 139px;">签订日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="qd_Date" id="qd_Date" lay-verify="qd_Date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" style="width: 280px;" value="${rq}">
				      </div>
			    </div>
			 </div>
			 
		  <div class="layui-form-item layui-form-text">
	  		<label class="layui-form-label" style="width: 295px;">一、产品名称、规格型号、单价</label>
	  		<br>
		  	<div class="layui-input-block" style="text-align: left;left: -165px;top:10px;">
				<button type="button" class="layui-btn layui-btn-normal" onclick="addRow()"><i class="layui-icon">&#xe608;</i>新增一行</button>	
			 </div>
			  <div class="layui-input-block" style="top:15px;left: 10px;">
				<table class="table table-bordered" id="khlxrs" style="width: 100%">
				  <thead>
				    <tr>
				      <th scope="col" style="text-align: center;width: 5%">序号</th>
				      <th scope="col" style="text-align: center;width: 220px;">物资名称</th>
				      <th scope="col" style="text-align: center;width: 220px;">规格型号</th>
				      <th scope="col" style="text-align: center;width: 220px;">物料Id</th>
				      <th scope="col" style="text-align: center;width: 150px;">数量</th>
				      <th scope="col" style="text-align: center;width: 150px;">单位</th>
				      <th scope="col" style="text-align: center;width: 150px;">单价(元)</th>
				      <th scope="col" style="text-align: center;width: 150px;">金额(元)</th>
				      <th scope="col" style="text-align: center;width: 200px;">交货日期</th>
				      <th scope="col" style="text-align: center;width: 280px;">备注</th>
				      <th scope="col" style="text-align: center;width: 200px;">操作</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${orderList}" var="o">
					  <tr>
					  	<th scope='row' style='text-align: center;line-height:38px;'></th>
						<td>
							<input type="hidden" value="${o.sales_Contract_Id}" name="contract_Id">
							<input type='text' class='form-control' aria-label='' aria-describedby=''  name='material_Name' value="${o.material_Name}">
						</td>
						<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='specification_Type' value="${o.specification_Type}"  onblur="product_materielId(this)"></td>
						<td><input type='text' class='form-control bj' aria-label='' aria-describedby=''  name='materielId' value="${o.materielId}" readonly="readonly"></td>
						<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='sl' onchange='jejs(this)' value="${o.sl}"></td>
						<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='unit' value="${o.unit}"></td>
						<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='price' onchange='jejs(this)' value="${o.price}"></td>
						<td><input type='text' class='form-control bj' aria-label='' aria-describedby=''  name='total_price' readonly='readonly' value="${o.total_price}"></td>
						<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='jhrq' value="${o.jhrq}"></td>
						<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='bz' value="${o.bz}"></td>
						<td><button type='button' class='layui-btn layui-btn-danger' title='删除一行' onclick='deleteData(${o.sales_Contract_Id})'><i class='layui-icon'>&#xe640;</i></button></td>
					 </tr>
					</c:forEach>
				  	<tr>
				  		<td>
				  		</td>
				  		<td>
				  			合计总金额
				  		</td>
				  		<td colspan="9">
				  			<input type='text' class='form-control bj' aria-label='' aria-describedby='' style="width: 165px;" disabled="" id="totalprice">
				  		</td>
				  	</tr>
				  </tbody>
				</table>
			</div>
		</div>
			
		 <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label" style="width:120px;">备注</label>
		    <div class="layui-input-block">
		      <textarea placeholder="请输入内容" name="remarks"  lay-verify="remarks" id="remarks" class="layui-textarea" style="width:76.5%">${contract.remarks}</textarea>
		    </div>
		 </div>
		 
		  <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">二、质量技术要求标准</label>
		    <div class="layui-input-block">
		      <input type="text" id="zljsyq" name="zljsyq" lay-verify="zljsyq" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%" value="${contract.zljsyq}">
		    </div>
		  </div>
		  
		   <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">三、交货时间及地点 </label>
		    <div class="layui-input-block">
		      <input type="text" id="jhsjjdd" name="jhsjjdd" lay-verify="jhsjjdd" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%" value="${contract.jhsjjdd}">
		    </div>
		  </div>
		  
		   <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">四、运输及费用 </label>
		    <div class="layui-input-block">
		      <input type="text" id="ysjfy" name="ysjfy" lay-verify="ysjfy" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%" value="${contract.ysjfy}">
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">五、付款方式  </label>
		    <div class="layui-input-block">
		      <input type="text"  id="fkfs" name="fkfs" lay-verify="fkfs" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%" value="${contract.fkfs}">
		    </div>
		  </div>
		  
		   <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">六、违约责任   </label>
		    <div class="layui-input-block">
		      <input type="text" id="wyzr" name="wyzr" lay-verify="wyzr" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%" value="${contract.wyzr}">
		    </div>
		  </div>
		  
		   <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">七 </label>
		    <div class="layui-input-block">
		      <input type="text" id="wjsy" name="wjsy" lay-verify="wjsy" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%;margin-left: 90px;" value="${contract.wjsy}">
		    </div>
		  </div>
		  
		   <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">八 </label>
		    <div class="layui-input-block">
		      <input type="text" id="htfs" name="htfs" lay-verify="htfs" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%;margin-left: 90px;" value="${contract.htfs}">
		    </div>
		  </div>
		  
		   <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 200px;">九 </label>
		    <div class="layui-input-block">
		      <input type="text" id="sxrq" name="sxrq" id="sxrq" lay-verify="sxrq" autocomplete="off" placeholder="" class="layui-input" style="width:69.5%;margin-left: 90px;" value="${contract.sxrq}">
		    </div>
		  </div>
		  
		  <div class="layui-form-item layui-form-text">
			  <div class="layui-input-block">
				<table class="table table-bordered"  style="width: 100%">
				  <thead>
				    <tr>
				      <th scope="col" style="text-align: center;width: 50%">供方</th>
				      <th scope="col" style="text-align: center;width: 50%">需方</th>
				    </tr>
				  </thead>
				  <tbody>
				  <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">单位名称  </label>
							    <div class="layui-input-block">
							      <input type="text" id="gfdwmc" lay-verify="gfdwmc" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>				    	
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">单位名称  </label>
							    <div class="layui-input-block">
							      <input type="text" id="xfdwmc" lay-verify="xfdwmc" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				     <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">单位地址 </label>
							    <div class="layui-input-block">
							      <input type="text" id="gfdwdz" lay-verify="gfdwdz" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">单位地址 </label>
							    <div class="layui-input-block">
							      <input type="text" id="xfdwdz" lay-verify="xfdwdz" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				    <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:110px;">法定代表人 </label>
							    <div class="layui-input-block">
							      <input type="text" id="gffddbr" lay-verify="gffddbr" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:110px;">法定代表人 </label>
							    <div class="layui-input-block">
							      <input type="text" id="xffddbr" lay-verify="xffddbr" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				     <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:110px;">委托代理人</label>
							    <div class="layui-input-block">
							      <input type="text" id="gfwtdlr" lay-verify="gfwtdlr" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:110px;">委托代理人</label>
							    <div class="layui-input-block">
							      <input type="text" id="xfwtdlr" lay-verify="xfwtdlr" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				    <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">开户行</label>
							    <div class="layui-input-block">
							      <input type="text" id="gfkhh" lay-verify="gfkhh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">开户行</label>
							    <div class="layui-input-block">
							      <input type="text" id="xfkhh" lay-verify="xfkhh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				    <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">帐号</label>
							    <div class="layui-input-block">
							      <input type="text" id="gfzh" lay-verify="gfzh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">帐号</label>
							    <div class="layui-input-block">
							      <input type="text" id="xfzh" lay-verify="xfzh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				    <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">税号</label>
							    <div class="layui-input-block">
							      <input type="text" id="gfsh" lay-verify="gfsh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">税号</label>
							    <div class="layui-input-block">
							      <input type="text" id="xfsh" lay-verify="xfsh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				    <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">电话 </label>
							    <div class="layui-input-block">
							      <input type="text" id="gfdh" lay-verify="gfdh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">电话 </label>
							    <div class="layui-input-block">
							      <input type="text" id="xfdh" lay-verify="xfdh" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				     <tr>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">传真  </label>
							    <div class="layui-input-block">
							      <input type="text" id="gfcz" lay-verify="gfcz" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    	<td>
							<div class="layui-form-item">
							 <label class="layui-form-label" style="width:90px;">传真  </label>
							    <div class="layui-input-block">
							      <input type="text" id="xfcz" lay-verify="wyzr" autocomplete="off" placeholder="" class="layui-input bj" disabled="">
							    </div>
							 </div>
						</td>
				    </tr>
				    
				  </tbody>
				</table>
			</div>
		</div>
		
		<!--附件 -->
			 <div class="layui-upload">
				  <button type="button" class="layui-btn layui-btn-normal" id="testList" style="margin-left: -91.5%">选择多文件</button> 
				  <div class="layui-upload-list">
				    <table class="layui-table" style="width: 100%;">
				      <thead>
				        <tr>
					        <th style="text-align: center;">文件名</th>
					        <th style="text-align: center;">大小</th>
					        <th style="text-align: center;">状态</th>
					        <th style="text-align: center;">操作</th>
				      	</tr>
				      </thead>
				      <tbody id="demoList"></tbody>
				    </table>
				  </div>
				  <button type="button" class="layui-btn" id="testListAction" style="margin-left: -91.5%">开始上传</button>
			</div> 
	
		<div class="layui-form-item" style="text-align: center;">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit="" lay-filter="" style="width:25%;margin-top:10px;margin-left:-315px;" onclick="editContract()" type="button">立即提交</button>
		    </div>
		</div>
	</form>
 </div>
<script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="../layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate','upload'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,upload = layui.upload;
  var url=$('#url').val();
  form.render();
  allCustomer(form);
  allCompany(form);
  khlxrxh();
  jszje();
  loadKH(form);
  //日期
  laydate.render({
    elem: '#qd_Date'
    ,format: 'yyyy-MM-dd'
  });

 
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');



//多文件列表示例
  var fjsx=$('#fjsx').val();
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '<c:url value="/sales/upload.do"/>'
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        //将附件属性拼接字符串提交至后端
         var fj=res.data;
		 //将json串转换为字符串
		 var str = JSON.stringify(fj);
        if(undefined!=fjsx){
			 fjsx=fjsx+","+str;
			 $('#fjsx').val(fjsx);
		 }else{
			 fjsx=str;
			 $('#fjsx').val(fjsx);
		 }
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });

	//ajax实现下拉需方单位带出客户的相关属性
	form.on('select(customer)', function(data){
		//获得项目信息主键
		var customer_Id=data.value;
		if(customer_Id==""||customer_Id==undefined){
			$('#xfdwmc').val("");//需方单位名称
			$('#xfdwdz').val("");//需方单位地址
			$('#xffddbr').val("");//需方法定代表人
			$('#xfwtdlr').val("");//需方委托代理人
			$('#xfkhh').val("");//需方开户行
			$('#xfzh').val("");//需方账户
			$('#xfsh').val("");//需方税号
			$('#xfdh').val("");//需方电话
			$('#xfcz').val("");//需方传真
			return;
		}
		//ajax根据Id查询需方单位并设置其它属性值
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/customer.do'/>",
			async : false,
			dataType : 'json',
			data :{"customer_Id":customer_Id},
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$('#xfdwmc').val(msg.customer.unit_Name);//需方单位名称
				$('#xfdwdz').val(msg.customer.registered_Address);//需方单位地址
				$('#xffddbr').val(msg.customer.legal_person);//需方法定代表人
				$('#xfwtdlr').val(msg.customer.wtdlr);//需方委托代理人
				$('#xfkhh').val(msg.customer.opening_Bank);//需方开户行
				$('#xfzh').val(msg.customer.account_Number);//需方账户
				$('#xfsh').val(msg.customer.duty_Paragraph);//需方税号
				$('#xfdh').val(msg.customer.telPhone);//需方电话
				$('#xfcz').val(msg.customer.fax);//需方传真
			}
		});
	});
	fjPageLoad();
});

	//表格新增一行
	var index=0;
	function addRow(){
		var length=$("#khlxrs tbody").find("tr").length;
		//获取表格中的第一行
		var fristRow;
		for(var i=0;i<length;i++){
			var text="	合计总金额	";
			if($("#khlxrs tbody").find("tr")[i].innerText==text){
				fristRow=$("#khlxrs tbody").find("tr:eq('"+i+"')");
				break;
			}
		}
		//获得表格长度
		var khlxrSize=$('#khlxrSize').val();
		if("khlxrSize"!=""){
			khlxrSize++;
			$('#khlxrSize').val(khlxrSize);
			var tables=$('#khlxrs');
			var addtr = $("<tr>"+
				"<th scope='row' style='text-align: center;line-height:38px;'>"+khlxrSize+"</th>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='material_Name'></td>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='specification_Type' onblur='product_materielId(this)'></td>"+
				"<td><input type='text' class='form-control bj' aria-label='' aria-describedby=''  name='materielId' readonly='readonly'></td>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='sl' onchange='jejs(this)'></td>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='unit'></td>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='price' onchange='jejs(this)'></td>"+
				"<td><input type='text' class='form-control bj' aria-label='' aria-describedby=''  name='total_price' readonly='readonly'></td>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='jhrq'></td>"+
				"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='bz'></td>"+
				"<td><button type='button' class='layui-btn layui-btn-danger' title='删除一行' onclick='deleteTrRow(this)'><i class='layui-icon'>&#xe640;</i></button></td>"+
				"</tr>");
		 		fristRow.before(addtr);  
		}else{
			index++;
			var tables=$('#khlxrs');
			var addtr = $("<tr>"+
					"<th scope='row' style='text-align: center;line-height:38px;'>"+index+"</th>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='material_Name'></td>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='specification_Type' onblur='product_materielId(this)'></td>"+
					"<td><input type='text' class='form-control bj' aria-label='' aria-describedby=''  name='materielId' readonly='readonly'></td>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='sl' onchange='jejs(this)'></td>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='unit'></td>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='price' onchange='jejs(this)'></td>"+
					"<td><input type='text' class='form-control bj' aria-label='' aria-describedby=''  name='total_price' readonly='readonly'></td>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='jhrq'></td>"+
					"<td><input type='text' class='form-control' aria-label='' aria-describedby=''  name='bz'></td>"+
					"<td><button type='button' class='layui-btn layui-btn-danger' title='删除一行' onclick='deleteTrRow(this)'><i class='layui-icon'>&#xe640;</i></button></td>"+
					"</tr>");
			fristRow.before(addtr); 
		}     
	} 

	//表格删除一行
	function deleteTrRow(tr){
	    $(tr).parent().parent().remove();
	    index--;
		var data=$('input[name="total_price"]');
		//遍历该数组
		var totalPrice=0;
		for(var i=0;i<data.length;i++){
			if(data[i].value!=undefined){
				//设置总金额
				totalPrice=(totalPrice*1)+(data[i].value*1);
			}
		}
		$('#totalprice').val(totalPrice);
	} 

	//ajax实现查询所有的客户
	function  allCustomer(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/customerList.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#customer").append(
							"<option value='"+msg[i].customer_Id+"'>"+ msg[i].unit_Name +"</option>");
				}
				form.render('select');
			}
		});
	}

	//自动加载所属客户
	function loadKH(form){
		//获得需求方代码
		var xfdw=$('#xfdw').val();
		//遍历客户下拉选
		var ygxxs=$('#customer').find('option');
		for(var i=0;i<ygxxs.length;i++){
			if(ygxxs[i].value==xfdw){
				ygxxs[i].setAttribute("selected",'true');
				break;
			}
		}
		//ajax根据Id查询需方单位并设置其它属性值
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/customer.do'/>",
			async : false,
			dataType : 'json',
			data :{"customer_Id":xfdw},
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$('#xfdwmc').val(msg.customer.unit_Name);//需方单位名称
				$('#xfdwdz').val(msg.customer.registered_Address);//需方单位地址
				$('#xffddbr').val(msg.customer.legal_person);//需方法定代表人
				$('#xfwtdlr').val(msg.customer.wtdlr);//需方委托代理人
				$('#xfkhh').val(msg.customer.opening_Bank);//需方开户行
				$('#xfzh').val(msg.customer.account_Number);//需方账户
				$('#xfsh').val(msg.customer.duty_Paragraph);//需方税号
				$('#xfdh').val(msg.customer.telPhone);//需方电话
				$('#xfcz').val(msg.customer.fax);//需方传真
			}
		});
		form.render('select');
	}


	//ajax查询供货方
	function  allCompany(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/company.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$('#supplier').val(msg.unit.unit_Id);//供货方
				$("#ghdw").val(msg.unit.unit_Name);//供方单位名称
				$('#gfdwmc').val(msg.unit.unit_Name);//供方单位名称
				$('#gfdwdz').val(msg.unit.registered_Address);//供方单位地址
				$('#gffddbr').val(msg.unit.legal_person);//供方法定代表人
				$('#gfwtdlr').val(msg.unit.wtdlr);//供方委托代理人
				$('#gfkhh').val(msg.unit.opening_Bank);//供方开户行
				$('#gfzh').val(msg.unit.account_Number);//供方账户
				$('#gfsh').val(msg.unit.duty_Paragraph);//供方税号
				$('#gfdh').val(msg.unit.telPhone);//供方电话
				$('#gfcz').val(msg.unit.fax);//供方传真
			}
		});
		form.render();
	}

	
	function khlxrxh(){
		var len = $('#khlxrs tr').length;
	    for(var i = 1;i<len;i++){
	        $('#khlxrs tr:eq('+i+') th:first').text(i);
	    }
	}

	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
			window.parent.location.reload();
			window.close();
		} 
	}

	//页面加载时自动计算总金额
	function jszje(){
		var data=$('input[name="total_price"]');
		//遍历该数组
		var totalPrice=0;
		for(var i=0;i<data.length;i++){
			if(data[i].value!=undefined){
				//设置总金额
				totalPrice=(totalPrice*1)+(data[i].value*1);
			}
		}
		$('#totalprice').val(totalPrice);
	}
	
	//设置金额自动计算
	function jejs(obj){
		//获得当前表格行索引
		var index=obj.parentElement.parentElement.rowIndex;
		//获得数量
		var sl=$('input[name="sl"]')[index-1].value;
		//获得单价
		var dj=$('input[name="price"]')[index-1].value;
		if(sl!=""&&dj!=""){
			//设置金额
			$('input[name="total_price"]')[index-1].value=(sl*1)*(dj*1);
		}
		if(sl==""||dj==""){
			//设置金额
			$('input[name="total_price"]')[index-1].value="";
		}
		var data=$('input[name="total_price"]');
		//遍历该数组
		var totalPrice=0;
		for(var i=0;i<data.length;i++){
			if(data[i].value!=undefined){
				//设置总金额
				totalPrice=(totalPrice*1)+(data[i].value*1);
			}
		}
		$('#totalprice').val(totalPrice);
	}

	function deleteData(contract_Id){
		//ajax实现删除数据
		layer.confirm('您确定要删除该数据吗？此操作将不可逆转!!!', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				//删除数据
				  $.ajax({  
					    type: "post",  
					    url:  "<c:url value='/sales/deleteOrderById.do'/>",
					    dataType: 'json',
					    async:false,
					    data:{"contract_Id":contract_Id},
					    error:function(){
					    	alert("出错");
					    },
					    success: function (data) {  
						    if(data.flag){
					    		layer.close(index);
					    		window.location.reload();
						    }
					    }  
					});
			  }
		  );
	}

	

	//编辑销售合同
	function editContract(){
		//创建销售合同对象
		var xsht=new Object();
		//获得销售合同主键
		var  id=$('#sales_Contract_Id').val();
		//获得合同名称
		var htmc=$('#sales_Contract_Name').val();
		if(htmc==""){
			return layer.alert("合同名称不能为空!",{icon:7});
		}
		//获得供货单位
		var ghdw=$('#supplier').val();
		//合同编号
		var htbh=$('#contract_Code').val();
		//需求方
		var xqf=$('#customer').val();
		if(xqf==""){
			return layer.alert("需方单位不能为空!",{icon:7});
		}
		//签订日期
		var qdrq=$('#qd_Date').val();
		//备注
		var bz=$('#remarks').val();
		//质量技术要求
		var zljsyq=$('#zljsyq').val();
		//交货时间及地点
		var jhsjjdd=$('#jhsjjdd').val();
		//运输及费用
		var ysjfy=$('#ysjfy').val();
		//付款方式
		var fkfs=$('#fkfs').val();
		//违约责任
		var wyzr=$('#wyzr').val();
		//未尽事宜
		var wjsy=$('#wjsy').val();
		//合同份数
		var htfs=$('#htfs').val();
		//生效日期
		var sxrq=$('#sxrq').val();
		//附件
		var fjsx=$('#fjsx').val();
		//任务Id
		var taskId=$('#taskId').val();
		//流程审批代码
		var approvalDm=$('#approvalDm').val();
		//代办任务描述
		var task_Describe=$('#task_Describe').val();
		//合同金额
		var htje=$('#totalprice').val();
		xsht.sales_Contract_Id=id;
		xsht.sales_Contract_Name=htmc;
		xsht.contract_Code=htbh;
		xsht.customer=xqf;
		xsht.qd_Date=qdrq;
		xsht.remarks=bz;
		xsht.zljsyq=zljsyq;
		xsht.jhsjjdd=jhsjjdd;
		xsht.ysjfy=ysjfy;
		xsht.fkfs=fkfs;
		xsht.wyzr=wyzr;
		xsht.wjsy=wjsy;
		xsht.htfs=htfs;
		xsht.sxrq=sxrq;
		xsht.supplier=ghdw;
		xsht.unitAddress="";
		xsht.agent="";
		xsht.cus_Address="";
		xsht.fjsx=fjsx;
		xsht.taskId=taskId;
		xsht.approvalDm=approvalDm;
		xsht.task_Describe=task_Describe;
		xsht.is_xsddprcedf="";
		xsht.htje=htje;
		xsht.is_scsk="";
		xsht.is_delivery="";
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/editSales.do'/>",
			async : false,
			contentType :"application/json;charsetset=UTF-8",//必须
			dataType : 'json',
			data:JSON.stringify(xsht),
			error : function() {
				alert("出错");
			},
			success : function(data) {
				if(data.flag){
					saveOrEditContractOrder();
				}
			}
		});
	}


	//新增/编辑产品名称
	function saveOrEditContractOrder(){
		//货物当前表格
		var tables=$('#khlxrs');
		//获得表格所有行
		var rows=tables[0].rows;
		//创建货物清单数组
		var orders=new Array();
		//获取销售合同主键
		var xshtId=$('#sales_Contract_Id').val();
		//遍历表格
		for(var i=0;i<rows.length;i++){
			if(i+1==rows.length-1){
				break
				//主键
				var id=""
				if($('input[name="contract_Id"]')[i]!=undefined){
					id=$('input[name="contract_Id"]')[i].value;
				}
				//物资名称
				var wzmc=$('input[name="material_Name"]')[i].value;
				//规格型号
				var ggxh=$('input[name="specification_Type"]')[i].value;
				//物料Id
				var wlId=$('input[name="materielId"]')[i].value;
				//数量
				var sl=$('input[name="sl"]')[i].value;
				//单位
				var dw=$('input[name="unit"]')[i].value;
				//单价
				var dj=$('input[name="price"]')[i].value;
				//金额
				var je=$('input[name="total_price"]')[i].value;
				//交货日期
				var jhrq=$('input[name="jhrq"]')[i].value;
				//备注
				var bz=$('input[name="bz"]')[i].value;
				//创建货物清单对象
				var order=new Object();
				order.sales_Contract_Id=id;
				order.material_Name=wzmc;
				order.specification_Type=ggxh;
				order.materielId=wlId;
				order.sl=sl;
				order.unit=dw;
				order.price=dj;
				order.total_price=je;
				order.jhrq=jhrq;
				order.bz=bz;
				order.sales_Contract=xshtId;
				orders.push(order);
			}else{
				//主键
				var id="";
				if($('input[name="contract_Id"]')[i]!=undefined){
					id=$('input[name="contract_Id"]')[i].value;
				}
				//物资名称
				var wzmc=$('input[name="material_Name"]')[i].value;
				//规格型号
				var ggxh=$('input[name="specification_Type"]')[i].value;
				//物料Id
				var wlId=$('input[name="materielId"]')[i].value;
				//数量
				var sl=$('input[name="sl"]')[i].value;
				//单位
				var dw=$('input[name="unit"]')[i].value;
				//单价
				var dj=$('input[name="price"]')[i].value;
				//金额
				var je=$('input[name="total_price"]')[i].value;
				//交货日期
				var jhrq=$('input[name="jhrq"]')[i].value;
				//备注
				var bz=$('input[name="bz"]')[i].value;
				//创建货物清单对象
				var order=new Object();
				order.sales_Contract_Id=id;
				order.material_Name=wzmc;
				order.specification_Type=ggxh;
				order.materielId=wlId;
				order.sl=sl;
				order.unit=dw;
				order.price=dj;
				order.total_price=je;
				order.jhrq=jhrq;
				order.bz=bz;
				order.sales_Contract=xshtId;
				orders.push(order);
			}
		}
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/saveOrEditOrder.do'/>",
			async : false,
			contentType :"application/json;charsetset=UTF-8",//必须
			dataType : 'json',
			data:JSON.stringify(orders),
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				if(msg.flag){
					window.parent.location.reload();
					window.close();
				} 
			}
		});
	}

	//加载成品对应的物料Id
	function product_materielId(obj){
		//获得当前表格行索引
		var index=obj.parentElement.parentElement.rowIndex;
		var specification_Type=obj.value;
			$.ajax({
				type : "post",
				url : "<c:url value='/product/product_materielId.do'/>",
				async : false,
				dataType : 'json',
				data:{"specification_Type":specification_Type},
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					if(msg.materielId!=undefined){
						$('input[name="materielId"]')[index-1].value=msg.materielId;
					}else{
						$('input[name="materielId"]')[index-1].value="";
					}
				}
			});
	}

	function  fjPageLoad(){
		var row_Id=$('#sales_Contract_Id').val();
		var demoListView = $('#demoList');
		$.ajax({
			type : "post",
			url : "<c:url value='/sales/pageLoadFj.do'/>",
			async : false,
			dataType : 'json',
			data:{"row_Id":row_Id},
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for(var i=0;i<msg.length;i++){
					  var tr = $(['<tr id="upload-'+ i+1 +'">'
			          ,'<td>'+msg[i].fileName+'</td>'
			          ,'<td>'+msg[i].fileSize+'</td>'
			          ,'<td>已经上传</td>'
			          ,'<td>'
			            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
			            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete" onclick="removeFile(this)" type="button">删除</button>'
			          ,'</td>'
			        ,'</tr>'].join(''));
				  demoListView.append(tr);
				}
			}
		});
	}

	function removeFile(obj){
		//获得当前表格行索引
		var index=obj.parentElement.parentElement.rowIndex;
		var demoListView = $('#demoList');
		var row_Id=$('#sales_Contract_Id').val();
		//获得当前表格中的文件名
		var fileName=demoListView[0].rows[index-1].cells[0].innerText;
		layer.confirm('您确定要删除该附件么？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示',icon:7},function(){
				  $.ajax({
						type : "post",
						url : "<c:url value='/sales/removeFj.do'/>",
						async : false,
						dataType : 'json',
						data:{"row_Id":row_Id,"fileName":fileName},
						error : function() {
							alert("出错");
						},
						success : function(msg) {
							if(msg.flag){
								demoListView[0].rows[index-1].remove();
							    var rowNum = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		                        location.reload();//刷新父页面，注意一定要在关闭当前iframe层之前执行刷新
		                        layer.close(rowNum); //再执行关闭
							}
						}
					});
			  }
			)
	}
</script>
</body>
</html>