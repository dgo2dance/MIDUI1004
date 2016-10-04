<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#STARTAGE").val()==""){
			$("#STARTAGE").tips({
				side:3,
	            msg:'请输入开始年龄',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STARTAGE").focus();
			return false;
		}
		if($("#ENDAGE").val()==""){
			$("#ENDAGE").tips({
				side:3,
	            msg:'请输入结束年龄',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENDAGE").focus();
			return false;
		}
		if($("#CITY").val()==""){
			$("#CITY").tips({
				side:3,
	            msg:'请输入城市',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CITY").focus();
			return false;
		}
		if($("#XUELI").val()==""){
			$("#XUELI").tips({
				side:3,
	            msg:'请输入学历',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#XUELI").focus();
			return false;
		}
		if($("#SHOURU").val()==""){
			$("#SHOURU").tips({
				side:3,
	            msg:'请输入收入',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SHOURU").focus();
			return false;
		}
		if($("#ZHIYE").val()==""){
			$("#ZHIYE").tips({
				side:3,
	            msg:'请输入职业',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ZHIYE").focus();
			return false;
		}
		if($("#MYDESC").val()==""){
			$("#MYDESC").tips({
				side:3,
	            msg:'请输入一句话说明',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MYDESC").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="chooseobject/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CHOOSEOBJECT_ID" id="CHOOSEOBJECT_ID" value="${pd.CHOOSEOBJECT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">开始年龄:</td>
				<td><input type="text" name="STARTAGE" id="STARTAGE" value="${pd.STARTAGE}" maxlength="32" placeholder="这里输入开始年龄" title="开始年龄"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">结束年龄:</td>
				<td><input type="text" name="ENDAGE" id="ENDAGE" value="${pd.ENDAGE}" maxlength="32" placeholder="这里输入结束年龄" title="结束年龄"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">城市:</td>
				<td><input type="text" name="CITY" id="CITY" value="${pd.CITY}" maxlength="32" placeholder="这里输入城市" title="城市"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学历:</td>
				<td><input type="text" name="XUELI" id="XUELI" value="${pd.XUELI}" maxlength="32" placeholder="这里输入学历" title="学历"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收入:</td>
				<td><input type="text" name="SHOURU" id="SHOURU" value="${pd.SHOURU}" maxlength="32" placeholder="这里输入收入" title="收入"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">职业:</td>
				<td><input type="text" name="ZHIYE" id="ZHIYE" value="${pd.ZHIYE}" maxlength="32" placeholder="这里输入职业" title="职业"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">一句话说明:</td>
				<td><input type="text" name="MYDESC" id="MYDESC" value="${pd.MYDESC}" maxlength="32" placeholder="这里输入一句话说明" title="一句话说明"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>