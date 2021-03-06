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
<title>查看销售合同收款</title>
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<link href="../login/css/xshtfp.css" rel="stylesheet"/>
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body style="width:100%;padding:0px; margin:0px;">
	<div class="m-xm_message_box">
			<div>
				<strong id="_field_xiaoShouHTMC" class="u-header_link">${contract.sales_Contract_Name}</strong>
				<div class="oim-field u-header" style=" margin:10px 0 0 0px;">
		             <label for="" class="oim-field_label u-f13">合同编号</label>
		             <span class="oim-field_text-show u-f13" id="_field_xiangMuXXBH">
		             	${contract.contract_Code}
		             </span>
		         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             <label for="" class="oim-field_label u-f13">合同金额</label>
		              <span class="u-num" id="_heTongJE" style="color:#666;">${contract.htje}</span>
		              <span class="u-rmb">元</span>
		             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             <label for="" class="oim-field_label u-f13">累计开票金额</label>
		             <span id="_leiJiKPJE">${ljkpje}</span>
		                <span class="u-rmb">元</span>
						 <div class="layui-progress" lay-showpercent="true" style="width: 6%; display: inline-block;">
						  <div class="layui-progress-bar" lay-percent="${ljkpjebl}"></div>
						 </div>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="" class="oim-field_label u-f13">剩余开票金额</label>
		             <span id="_shengYuKPJE">${sykpje}</span>
		             <span class="u-rmb">元</span>
		              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="" class="oim-field_label u-f13">累计收款金额</label>
		             <span id="_shengYuKPJE">${ljskje}</span>
		             <span class="u-rmb">元</span>
	             	 <div class="layui-progress" lay-showpercent="true" style="width: 6%; display: inline-block;">
					  <div class="layui-progress-bar" lay-percent="${ljskjebl}"></div>
					 </div>
				     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="" class="oim-field_label u-f13">剩余收款金额</label>
		             <span id="_shengYuKPJE">${syskje}</span>
		             <span class="u-rmb">元</span>
		        </div>	
			</div>
		</div>
	<div class="layui-tab">
		  <ul class="layui-tab-title">
		    <li class="layui-this">基本信息</li>
		    <li>评审意见</li>
		    <li>任务附件</li>
		    <li>流程检视</li>
		  </ul>
	   <div class="layui-tab-content">
		 <div class="layui-tab-item layui-show">
				<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
					<form class="layui-form" action='<c:url value=""/>' method="post">
						<input type="hidden" id="url" value='<c:url value="/"/>'>
						<input type="hidden" value="${taskId}" id="taskId">
						<input type="hidden" id="sales_Contract_Id" value="${contract.sales_Contract_Id}">
						<input type="hidden" id="xshtskdm" value="${xshtsk.xshtskdm}">
						<input type="hidden" id="processInstanceId" value="${processInstanceId}">
						<input type="hidden" id="OBJDM" value="${OBJDM}">
						<input type="hidden" value="${ldsh}" id="ldsh"> 
						
						
				<div style="margin-top:3%;">
					<span style="font-size: 20px;top: -10px;color: #4391e1">付款方信息</span>
				</div>
			
				<div class="layui-form-item">
				     <div class="layui-inline" style="top:9px;">
					      <label class="layui-form-label" style="width:150px;">付款方</label>
					      <div class="layui-input-inline">
					        <input type="text"   lay-verify="" autocomplete="off" class="layui-input bj" style="width:750px;" disabled="" value="${customer.unit_Name}">
					      </div>
				     </div>
				 </div>
				 
				 <div class="layui-form-item">
				      <div class="layui-inline" style="top:9px;">
					      <label class="layui-form-label" style="width:150px;">开户银行</label>
					      <div class="layui-input-inline">
					        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${customer.opening_Bank}">
					      </div>
				     </div>
				     
				      <div class="layui-inline" style="top:9px;left: 106px;">
					      <label class="layui-form-label" style="width:150px;">银行账号</label>
					      <div class="layui-input-inline">
					        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${customer.account_Number}">
					      </div>
				     </div>
				 </div>
				 
			<div>
				<span style="font-size: 20px;top: -10px;color: #4391e1">收款信息</span>
			</div>
			
			 <div class="layui-form-item">
				  <div class="layui-inline" style="top:9px;left:-15px;">
					      <label class="layui-form-label" style="width: 164px;">是否发票开具</label>
					      <div class="layui-input-inline">
					        <input type="text"   lay-verify=""  autocomplete="off" class="layui-input bj" style="width: 280px;" value="${fpkj}" disabled="" id="fpkj">
					      </div>
				    </div>
				    
				    <div class="layui-inline" style="top:9px;left: 79px;">
					      <label class="layui-form-label" style="width: 164px;">申请开票日期</label>
					      <div class="layui-input-inline">
					        <input type="text"   lay-verify="" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" style="width: 280px;" value="${xshtsk.shenqkprq}" disabled="">
					      </div>
				    </div>
			 </div>
			 
			 <div class="layui-form-item">
			 
			      <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width:150px;">应收款</label>
				      <div class="layui-input-inline">
				        <input type="text"    lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" value="${xshtsk.ysk}" disabled="">
				      </div>
			     </div>
			     
			     <div class="layui-inline" style="top:9px;left: 107px;" id="kpjes">
				      <label class="layui-form-label" style="width:150px;">开票金额</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" value="${xshtsk.kpje}" disabled="">
				      </div>
			     </div>
			     
			 </div>
				
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width:150px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="remarks"  lay-verify="remarks" id="remarks" class="layui-textarea bj" style="width:64.2%" disabled="">${xshtsk.remarks}</textarea>
			    </div>
			 </div>
			 
			<div>
				<span style="font-size: 20px;top: -10px;color: #4391e1">开票信息</span>
			</div>
			
			<div class="layui-form-item">
			
				<div class="layui-inline" style="top:9px;left: 30px;" id="fplbs">
				    <label class="layui-form-label" style="width: 120px;">发票类别</label>
				    <div class="layui-input-block" style="width: 332px;">
				     	<input type="text" id="fplb"  lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" disabled="" value="${fplb}">
				    </div>
			    </div>
			    
			     <div class="layui-inline"style="top:9px;left:13px;" id="gsmcs">
				      <label class="layui-form-label" style="width:150px;">公司名称</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" disabled="" value="${customer.unit_Name}">
				      </div>
			     </div>
			</div>
			 
			 <div class="layui-form-item" id="shs">
			      <div class="layui-inline" style="top:9px;" id="sh">
				      <label class="layui-form-label" style="width:150px;">税号</label>
				      <div class="layui-input-inline">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${customer.duty_Paragraph}">
				      </div>
			     </div>
			     
			      <div class="layui-inline" style="top:9px;left: 106px;" id="yydzs">
				      <label class="layui-form-label" style="width:150px;">营业地址</label>
				      <div class="layui-input-inline">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${customer.office_Address}">
				      </div>
			     </div>
			 </div>
			 
			  <div class="layui-form-item" id="khhs">
			 	 <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width:150px;">开户行</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" disabled="" value="${customer.opening_Bank}">
				      </div>
			     </div>
			     
			      <div class="layui-inline" style="top:9px;left: 106px;" id="khhzhs">
				      <label class="layui-form-label" style="width:150px;">开户行账号</label>
				      <div class="layui-input-inline">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${customer.account_Number}">
				      </div>
			     </div>
			     
			     
			 </div>
			 
		
		 <div class="layui-form-item">
		 
		  	 <div class="layui-inline" style="top:9px;" id="lxdhs">
				      <label class="layui-form-label" style="width:150px;">联系电话</label>
				      <div class="layui-input-inline">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${customer.telPhone}">
				      </div>
		     </div>
		 
		 	 <div class="layui-inline" style="top:9px;left: 106px;" id="fpjes">
			      <label class="layui-form-label" style="width:150px;">发票金额</label>
			      <div class="layui-input-inline">
			        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" value="${xshtsk.fpje}" disabled="">
			      </div>
		     </div>
		 
		 	
		 </div>
		 
		  <div class="layui-form-item">
			   <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width:150px;">实际收款金额</label>
				      <div class="layui-input-inline">
				        <input type="text" lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;"  value="${xshtsk.sjsk}" disabled="">
				      </div>
			     </div>
			    
			    <div class="layui-inline" style="top:9px;left: 106px;">
				      <label class="layui-form-label" style="width: 150px;">开票日期</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" placeholder="" autocomplete="off" class="layui-input bj" style="width: 280px;" value="${xshtsk.kaiprq}" disabled="">
				      </div>
			    </div>
		  </div>
		 
		  <div class="layui-form-item" style="top:9px;" id="sls">
			  	<div class="layui-inline" style="top:9px;" id="sl">
				      <label class="layui-form-label" style="width: 150px;">税率</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" autocomplete="off" class="layui-input bj" style="width:280px;" value="${xshtsk.sl}" disabled="">
				      </div>
			    </div>
		  </div>
	   </form>
	</div>
  </div>
					 
		 <!--评审意见  -->
			<div class="layui-tab-item">
				<div class="layui-collapse">
					<c:forEach items="${reviewOpinions}" var="r">
						 <div class="layui-colla-item" >
				   			<h2 class="layui-colla-title">${r.time}&nbsp;&nbsp;&nbsp;${r.TASK_NAME_}&nbsp;&nbsp;&nbsp;${r.userName}---->${r.TITLE_}</h2>
					   			
					   			<c:if test="${(not empty r.MESSAGE_RESULT_)&&(not empty r.MESSAGE_INFOR_)}">
								    <div class="layui-colla-content layui-show">
								    		审批结果:<span style="color: green">${r.MESSAGE_RESULT_ }</span> </br>
											审批意见:<span style="color: green">${r.MESSAGE_INFOR_ }</span>
								    </div>
							   	</c:if> 
				 		 </div>
				 	</c:forEach>
				</div>
			</div>
			<!--附件  -->
			<div class="layui-tab-item">
				<p>任务附件</p>
				<table class="layui-hide" id="test" lay-filter="test"></table>
				<form id="downForm" method="post" action="" enctype="multipart/form-data">
					<input type="hidden" id="ftpPath">
					<input type="hidden" id="rEALWJM">
				</form>
			</div>
			<!--流程检视  -->
			<div class="layui-tab-item">
				<img style="position: absolute; top:165px; left:10%;width:90%;" id="lct" src=''>
			</div>
		</div>
  	</div>
	  <!-- 操作 Begin -->
			<div id="myMenu" class="m-operation_box" style="width: 140px;display: none;">
				<h3 class="u-operation_title">操作</h3>
				<div>
					<ul class="u-menu_option">
						<li id="_zxys_deal_btn">处理</li>
						<li id="_zxys_retake_btn">退回</li> 
						<li id="_zxys_transmit_btn">转交</li>
						<!-- <li id="_zxys_reject_btn">退回上一步</li> -->
						<li id="_zxys_gaveUp_btn">放弃流程</li>
						<li id="_zxys_restart_btn">重启流程</li>
					</ul>
				</div>
			</div>
		<!-- 操作 End -->
<script type="text/html" id="barDemo">
  <!--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="yl" name="defaultAD">预览</a>-->
  <a class="layui-btn layui-btn-xs" lay-event="xz">下载</a>
</script>
<script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="../layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','upload','element','table'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,upload = layui.upload;
  var element = layui.element;
  var url=$('#url').val();
  var table = layui.table;
  var OBJId=$('#OBJDM').val();
  var objId=$('#taskId').val();
  lct();
  menue();
  ycth();
  pageRelady();
  form.render();
 
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');

  table.render({
	    elem: '#test'
	    ,url:url+'enclosure/enclosureList.do?OBJDM='+OBJId
	    ,title: '任务附件'
	    ,cols: [[
	       {field:'index', width:"10%", title: '序号', sort: true,type:'numbers'}
	      ,{field:'REALWJM', width:"80%",align:'left', title: '文件名称'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
	    ]]
	  });

  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //存储在ftp服务器端的地址
    var ftpPath=data.SHANGCHUANDZ;
    //存储在ftp的真实文件名
    var rEALWJM=data.REALWJM;
    var url=$('#url').val();
    $('#ftpPath').val(ftpPath);
    $('#rEALWJM').val(rEALWJM);
	var form = document.getElementById('downForm');
    //console.log(obj)
    if(obj.event === 'xz'){
    	//下载文件
    	form.action=url+"sales/downloadFtpFile.do?ftpPath="+ftpPath+"&"+"rEALWJM="+rEALWJM;
    	form.submit();
    }
  });
});

$("#myMenu").draggable(); 

	 function lct(){
	 	var img=$('#lct');
	 	var processInstanceId=$('#processInstanceId').val();
	 	var url=$('#url').val();
	 	img.attr("src",url+"viewImage/graphHistoryProcessInstance.do?processInstanceId="+processInstanceId)
	 }

	//点击处理跳转相应页面
	 $('#_zxys_deal_btn').click(function(){
			 var url=$('#url').val();
			 var taskId=$('#taskId').val();
			 $.ajax({
					type : "post",
					url : "<c:url value='/myTask/dealWith.do'/>",
					async : false,
					dataType : 'json',
					data:{"taskId":taskId},
					error : function() {
						alert("出错");
					},
					success : function(msg) {
						if(msg.flag){
							return layer.alert(msg.infor,{icon:7});
						}else{
							var result=msg.result;
							var objId=msg.business_key;
							var task_Id=msg.taskId;
							var narrow=msg.narrow;
							if(narrow){
								parent.layer.open({
							       	  	type:2,
							       	  	title:msg.taskName,
							       	  	area: ['50%','50%'],
							       		shadeClose: false,
							       		resize:false,
							       	    anim: 4,
							       	 	content:[url+result+"?objId="+objId+"&taskId="+task_Id,'yes']
							     });
							}else{
								parent.layer.open({
						       	  	type:2,
						       	  	title:msg.taskName,
						       	  	area: ['100%','100%'],
						       		shadeClose: false,
						       		resize:false,
						       	    anim: 4,
						       	 	content:[url+result+"?objId="+objId+"&taskId="+task_Id,'yes']
						    	 });
							}
						}
					}
				});
		 });


	//点击放弃流程跳转相应页面
	 $('#_zxys_transmit_btn').click(function(){
			 var url=$('#url').val();
			 var taskId=$('#taskId').val();
			 layer.open({
		       	  	type:2,
		       	  	title:'选择用户',
		       	  	area: ['60%','60%'],
		       		shadeClose: false,
		       		resize:false,
		       	    anim: 4,
		       	 	content:[url+"zj/initZhuanJiao.do?taskId="+taskId,'yes']
		     });
		 });

	//点击转交跳转相应页面
	 $('#_zxys_gaveUp_btn').click(function(){
			 var url=$('#url').val();
			 var taskId=$('#taskId').val();
			 var xshtskdm=$('#xshtskdm').val();
			 layer.open({
		       	  	type:2,
		       	  	title:'放弃流程',
		       	  	area: ['40%','50%'],
		       		shadeClose: false,
		       		resize:false,
		       	    anim: 4,
		       	 	content:[url+"fqlc/initFqlc.do?taskId="+taskId+"&objId="+xshtskdm,'yes']
		     });
		 });

	 //点击重启流程
	 $('#_zxys_restart_btn').click(function(){
			 var url=$('#url').val();
			 var taskId=$('#taskId').val();
			 layer.open({
		       	  	type:2,
		       	  	title:'重启流程',
		       	  	area: ['40%','30%'],
		       		shadeClose: false,
		       		resize:false,
		       	    anim: 4,
		       	 	content:[url+"cqlc/initCqlc.do?taskId="+taskId,'yes']
		     });
		 });

		//点击退回操作
		$('#_zxys_retake_btn').click(function(){
				 var url=$('#url').val();
				 var taskId=$('#taskId').val();
				 layer.open({
			       	  	type:2,
			       	  	title:'退回流程',
			       	  	area: ['40%','50%'],
			       		shadeClose: false,
			       		resize:false,
			       	    anim: 4,
			       	 	content:[url+"takeBack/initTakeBack.do?taskId="+taskId,'yes']
			     });
		 });

		//显示/隐藏操作面板
		function menue(){
			//获得任务Id
			var taskId=$('#taskId').val();
			if(taskId!=""){
				 $('#myMenu').css('display','block');
			}else{
				 $('#myMenu').css('display','none');
			}
		}

		//点击销售合同名称跳转至销售合同查看页
		$('#_field_xiaoShouHTMC').click(function(){
			 var url=$('#url').val();
			 var sales_Contract_Id=$('#sales_Contract_Id').val();
			 parent.layer.open({
			  	  	type:2,
			  	  	title:'查看合同',
			  	  	area: ['100%','100%'],
			  		shadeClose: false,
			  		resize:false,
			  	    anim: 1,
			  	  	content:[url+"sales/salesShow.do?sales_Contract_Id="+sales_Contract_Id,'yes']
			});
		});

		 function ycth(){
				var ldsh=$('#ldsh').val();
				if(ldsh){
					$('#_zxys_retake_btn').hide();
				}
		}


		//页面加载事件
		function pageRelady(){
			//获取是否发票开具
			var fpkj=$('#fpkj').val();
			//获取发票类别
			var fplb=$('#fplb').val();
			if(fpkj=="是"){
				if(fplb=="增值税专用发票"){
					$('#fplbs').show();
					$('#gsmcs').show();
					$('#shs').show();
					$('#yydzs').show();
					$('#khhs').show();
					$('#khhzhs').show();
					$('#lxdhs').show();
					$('#fpjes').show();
					$('#sls').show();
				}else{
					$('#fplbs').show();
					$('#gsmcs').show();
					$('#shs').show();
					$('#fpjes').show();
					$('#sls').show();
					$('#yydzs').hide();
					$('#khhs').hide();
					$('#khhzhs').hide();
					$('#lxdhs').hide();
					$('#fpjes').css("left", "0px");
				}
			 }else{
				$('#fplbs').hide();
				$('#gsmcs').hide();
				$('#shs').hide();
				$('#yydzs').hide();
				$('#khhs').hide();
				$('#khhzhs').hide();
				$('#lxdhs').hide();
				$('#fpjes').hide();
				$('#sls').hide();
			}
		}
</script>
</body>
</html>