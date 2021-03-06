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
<title>新增采购合同付款</title>
<link href="../login/css/xshtfp.css" rel="stylesheet"/>
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body style="width:100%;padding:0px; margin:0px;"onload="refreshAndClose()">
	<div class="m-xm_message_box">
		<div>
			<strong id="_field_xiaoShouHTMC" class="u-header_link">${purchaseOrder.purchaseOrderName}</strong>
			<div class="oim-field u-header" style=" margin:10px 0 0 0px;">
	             <label for="" class="oim-field_label u-f13">合同编号</label>
	             <span class="oim-field_text-show u-f13" id="_field_xiangMuXXBH">
	             	${purchaseOrder.pur_Code}
	             </span>
	         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             <label for="" class="oim-field_label u-f13">合同金额</label>
		              <span class="u-num" id="_heTongJE" style="color:#666;">${purchaseOrder.totalPrice}</span>
		              <span class="u-rmb">元</span>
		             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             <label for="" class="oim-field_label u-f13">累计付款金额</label>
		             <span id="_leiJiKPJE">${ljfkje}</span>
		                <span class="u-rmb">元</span>
						 <div class="layui-progress" lay-showpercent="true" style="width: 6%; display: inline-block;">
						  <div class="layui-progress-bar" lay-percent="${ljfkjebl}"></div>
						 </div>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="" class="oim-field_label u-f13">剩余付款金额</label>
		             <span id="_shengYuKPJE">${syfkje}</span>
		             <span class="u-rmb">元</span>
	          </div>	
		</div>
	</div>
	
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/cghtfk/saveCghtfk.do"/>' method="post"  enctype="multipart/form-data">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}">
			<input type="hidden" id="supplier">
			<input type="hidden" id="fjsx" name="fjsx"> 
			<input type="hidden" id="cghtId" value="${purchaseOrder.pur_Order_Id}" name="cght">
			<input type="hidden" id="xshtId" value="${purchaseOrder.sales_Contract_Id}">
			<input type="hidden" id="syfkje" value="${syfkje}">	
		<div style="margin-top: 5%;">
			<span style="font-size: 20px;top: -10px;color: #4391e1">收款方信息</span>
		</div>
			
			<div class="layui-form-item">
			     <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width:150px;">供方</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" autocomplete="off" class="layui-input bj" style="width:750px;" disabled="" value="${supplier.supplier_Name}">
				      </div>
			     </div>
			 </div>
			 
			 <div class="layui-form-item">
			      <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width:150px;">开户银行</label>
				      <div class="layui-input-inline">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${supplier.opening_Bank}">
				      </div>
			     </div>
			     
			      <div class="layui-inline" style="top:9px;left: 106px;">
				      <label class="layui-form-label" style="width:150px;">银行账号</label>
				      <div class="layui-input-inline">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" style="width: 280px;" disabled="" value="${supplier.account_Number}">
				      </div>
			     </div>
			 </div>
			 
		<div>
			<span style="font-size: 20px;top: -10px;color: #4391e1">付款信息</span>
		</div>
		
		 <div class="layui-form-item">
			  <div class="layui-inline" style="top:9px;left: 30px;">
				    <label class="layui-form-label" style="width: 120px;">付款类型</label>
				    <div class="layui-input-block" style="width: 435px;">
				      <input type="radio" name="fklx" value="预付款" title="预付款"  lay-filter="fklx" lay-verify="fklx">
				      <input type="radio" name="fklx" value="进度款" title="进度款"  lay-filter="fklx"  lay-verify="fklx">
				      <input type="radio" name="fklx" value="质保金" title="质保金"  lay-filter="fklx"  lay-verify="fklx">
				      <input type="radio" name="fklx" value="到货/完工款" title="到货/完工款"  lay-filter="fklx"  lay-verify="fklx">
				    </div>
			    </div>
			    
			     <div class="layui-inline" style="top:9px;left:-15px;">
				    <label class="layui-form-label" style="width: 120px;">预算情况</label>
				    <div class="layui-input-block" style="width: 332px;">
				      <input type="radio" name="ysqk" value="预算内付款" title="预算内付款"  lay-filter="ysqk"  lay-verify="ysqk">
				      <input type="radio" name="ysqk" value="预算外付款" title="预算外付款"  lay-filter="ysqk"  lay-verify="ysqk">
				    </div>
		      </div>
			    
			   
		 </div>
		 
		 <div class="layui-form-item">
		 
		  	  <div class="layui-inline" style="top:9px;">
				      <label class="layui-form-label" style="width: 150px;">申请付款日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sqrq" id="sqrq"  lay-verify="sqrq" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" style="width: 280px;" value="${sqrq}" readonly="readonly">
				      </div>
			    </div>
		 
		      <div class="layui-inline" style="top:9px;left: 107px;">
			      <label class="layui-form-label" style="width:150px;">申请付款金额</label>
			      <div class="layui-input-inline">
			        <input type="text"  id="sqfkje" name="sqfkje" lay-verify="sqfkje" autocomplete="off" class="layui-input" style="width:280px;" onblur="checkSqfkje()">
			      </div>
		     </div>
		     
		 </div>
			
		 <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label" style="width:150px;">备注</label>
		    <div class="layui-input-block">
		      <textarea placeholder="请输入内容" name="remarks"  lay-verify="remarks" id="remarks" class="layui-textarea" style="width:64.2%"></textarea>
		    </div>
		 </div>
		 
		
		<!--附件 -->
			 <div class="layui-upload">
				  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
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
				  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
			</div> 
			
			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:25%;margin-top:10px;margin-left:-315px;">立即提交</button>
			    </div>
			</div>
	</form>
 </div>
<script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="../layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','upload','element'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  var url=$('#url').val();
  var upload = layui.upload;
  var element = layui.element;
  form.render();

 
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');

//监听提交
  form.on('submit(demo1)', function(data){
   /*  layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    }) */
    return true;
  });

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




	//自定义验证规则
	  form.verify({
		  fklx: function(value,item){
		      var verifyName=$(item).attr('name')
		      , verifyType=$(item).attr('type')
		      ,formElem=$(item).parents('.layui-form')//获取当前所在的form元素，如果存在的话
				,verifyElem=formElem.find('input[name='+verifyName+']')//获取需要校验的元素
				,isTrue= verifyElem.is(':checked')//是否命中校验
				,focusElem = verifyElem.next().find('i.layui-icon');//焦点元素
				if(!isTrue || !value){
				        //定位焦点
				        focusElem.css(verifyType=='radio'?{"color":"#FF5722"}:{"border-color":"#FF5722"});
				        //对非输入框设置焦点
				        focusElem.first().attr("tabIndex","1").css("outline","0").blur(function() {
				            focusElem.css(verifyType=='radio'?{"color":""}:{"border-color":""});
				         }).focus();
				        return '付款类型不能为空';
				}
		    }
		  ,ysqk: function(value,item){
		      var verifyName=$(item).attr('name')
		      , verifyType=$(item).attr('type')
		      ,formElem=$(item).parents('.layui-form')//获取当前所在的form元素，如果存在的话
				,verifyElem=formElem.find('input[name='+verifyName+']')//获取需要校验的元素
				,isTrue= verifyElem.is(':checked')//是否命中校验
				,focusElem = verifyElem.next().find('i.layui-icon');//焦点元素
				if(!isTrue || !value){
				        //定位焦点
				        focusElem.css(verifyType=='radio'?{"color":"#FF5722"}:{"border-color":"#FF5722"});
				        //对非输入框设置焦点
				        focusElem.first().attr("tabIndex","1").css("outline","0").blur(function() {
				            focusElem.css(verifyType=='radio'?{"color":""}:{"border-color":""});
				         }).focus();
				        return '预算情况不能为空';
				}
		    }
	      ,sqfkje:function(value){
		       if(value==""||value==null){
		           return '申请付款金额不能为空';
		       }
	      }
	  });
		

});

	//验证申请付款金额
	function checkSqfkje(){
		//获取剩余付款金额
		var syfkje=$('#syfkje').val()*1;
		//获取申请付款金额
		var sqfkje=$('#sqfkje').val()*1;
		if(sqfkje>syfkje){
			$('#sqfkje').val("");
			return layer.alert("申请付款金额不得大于剩余付款金额",{icon:7});
		}
	}

	//点击采购合同名称跳转至采购合同查看页
	$('#_field_xiaoShouHTMC').click(function(){
		 var url=$('#url').val();
		 var cghtId=$('#cghtId').val();
		 var xshtId=$('#xshtId').val();
		 if(xshtId==""){
			 parent.layer.open({
		      	  	type:2,
		      	  	title:'查看合同',
		      	  	area: ['100%','100%'],
		      		shadeClose: false,
		      		resize:false,
		      	    anim: 1,
		      	  	content:[url+"purchaseOrder/purchaseOrderShow.do?pur_Order_Id="+cghtId,'yes']
	    	  });
		}else{
			parent.layer.open({
    	  	  	type:2,
    	  	  	title:'查看合同',
    	  	  	area: ['100%','100%'],
    	  		shadeClose: false,
    	  		resize:false,
    	  	    anim: 1,
    	  	  	content:[url+"purchase/purchaseOrderShow.do?pur_Order_Id="+cghtId,'yes']
    		  });
		}
		
	});

	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
			window.parent.location.reload();
			window.close();
		} 
	}

</script>
</body>
</html>