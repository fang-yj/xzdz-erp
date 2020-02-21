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
<title>查看物料Id</title>
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
	<div style="width:1100px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/materielId/editMaterielId.do"/>' method="post">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}">
			<input type="hidden" value="${materielId.type}" id="lx">
			<input type="hidden" name="row_Id" value="${materielId.row_Id}">
			<div class="layui-form-item" style="margin-top:5%;">
			     <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width: 90px;">物料Id</label>
				      <div class="layui-input-inline">
				        <input type="text" name="materiel_Id" lay-verify="materiel_Id" autocomplete="off" class="layui-input bj" id="materiel_Id" value="${materielId.materiel_Id}" disabled="">
				      </div>
			     </div>
			     
			    <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width: 90px;">规格型号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="specification_Type" lay-verify="specification_Type" autocomplete="off" class="layui-input bj" id="specification_Type" disabled="" value="${materielId.specification_Type}">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width:150px;">保质期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="bzq" lay-verify="bzq" autocomplete="off" class="layui-input bj" id="bzq" value="${materielId.bzq}" disabled="">
				      </div>
			     </div>
			 </div>
			
			<div class="layui-form-item">
			     <div class="layui-inline" style="left: -182px;">
				      <label class="layui-form-label" style="width:105px;">参考单价</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ckdj" lay-verify="ckdj" autocomplete="off" class="layui-input bj" id="ckdj" value="${materielId.ckdj}" disabled="">
				      </div>
			     </div>
			     
			  	 <div class="layui-inline" style="left: -197px;">
				      <label class="layui-form-label" style="width:105px;">类型</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ckdj" lay-verify="ckdj" autocomplete="off" class="layui-input bj" id="ckdj" value="${materielId.typeName}" disabled="">
				      </div>
			     </div>
			     
		   </div>
		   
			
		 <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label" style="width:155px;">物料描述</label>
		    <div class="layui-input-block">
		      <textarea placeholder="请输入内容" name="remarks"  lay-verify="remarks" id="remarks" class="layui-textarea bj" style="width:86.6%" disabled="">${materielId.remarks}</textarea>
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
  reloadType();
  form.render();
 
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');

  
  
});

	

	
	
	
	
	
	
</script>
</body>
</html>