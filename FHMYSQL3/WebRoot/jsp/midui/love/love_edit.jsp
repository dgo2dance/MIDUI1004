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
			if($("#LOVEUSER").val()==""){
			$("#LOVEUSER").tips({
				side:3,
	            msg:'请输入心动用户ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LOVEUSER").focus();
			return false;
		}
		if($("#FROMLOVEUSER").val()==""){
			$("#FROMLOVEUSER").tips({
				side:3,
	            msg:'请输入被心动用户ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FROMLOVEUSER").focus();
			return false;
		}
		if($("#NOTE3").val()==""){
			$("#NOTE3").tips({
				side:3,
	            msg:'请输入备注3',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NOTE3").focus();
			return false;
		}
		if($("#NOTE4").val()==""){
			$("#NOTE4").tips({
				side:3,
	            msg:'请输入备注4',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NOTE4").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="love/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="LOVE_ID" id="LOVE_ID" value="${pd.LOVE_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">心动用户ID:</td>
				<td><input type="text" name="LOVEUSER" id="LOVEUSER" value="${pd.LOVEUSER}" maxlength="32" placeholder="这里输入心动用户ID" title="心动用户ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">被心动用户ID:</td>
				<td><input type="text" name="FROMLOVEUSER" id="FROMLOVEUSER" value="${pd.FROMLOVEUSER}" maxlength="32" placeholder="这里输入被心动用户ID" title="被心动用户ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">备注3:</td>
				<td><input type="text" name="NOTE3" id="NOTE3" value="${pd.NOTE3}" maxlength="32" placeholder="这里输入备注3" title="备注3"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">备注4:</td>
				<td><input type="text" name="NOTE4" id="NOTE4" value="${pd.NOTE4}" maxlength="32" placeholder="这里输入备注4" title="备注4"/></td>
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