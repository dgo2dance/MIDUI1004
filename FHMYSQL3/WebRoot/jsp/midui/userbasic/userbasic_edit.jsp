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
			if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			return false;
		}
		if($("#PASSWORD").val()==""){
			$("#PASSWORD").tips({
				side:3,
	            msg:'请输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PASSWORD").focus();
			return false;
		}
		if($("#REALNAME").val()==""){
			$("#REALNAME").tips({
				side:3,
	            msg:'请输入真实姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REALNAME").focus();
			return false;
		}
		if($("#SEX").val()==""){
			$("#SEX").tips({
				side:3,
	            msg:'请输入性别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SEX").focus();
			return false;
		}
		if($("#BIRTHDAY").val()==""){
			$("#BIRTHDAY").tips({
				side:3,
	            msg:'请输入生日',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BIRTHDAY").focus();
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
		if($("#HIGHT").val()==""){
			$("#HIGHT").tips({
				side:3,
	            msg:'请输入身高',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HIGHT").focus();
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
		if($("#WORKS").val()==""){
			$("#WORKS").tips({
				side:3,
	            msg:'请输入职业',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WORKS").focus();
			return false;
		}
		if($("#ISMARRIED").val()==""){
			$("#ISMARRIED").tips({
				side:3,
	            msg:'请输入是否有婚姻史',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ISMARRIED").focus();
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
		if($("#HEADIMG").val()==""){
			$("#HEADIMG").tips({
				side:3,
	            msg:'请输入头像',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HEADIMG").focus();
			return false;
		}
		if($("#PHONE").val()==""){
			$("#PHONE").tips({
				side:3,
	            msg:'请输入手机号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#WEIXIN").val()==""){
			$("#WEIXIN").tips({
				side:3,
	            msg:'请输入微信号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WEIXIN").focus();
			return false;
		}
		if($("#QQ").val()==""){
			$("#QQ").tips({
				side:3,
	            msg:'请输入QQ',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QQ").focus();
			return false;
		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入用户状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="userbasic/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="USERBASIC_ID" id="USERBASIC_ID" value="${pd.USERBASIC_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">用户名:</td>
				<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">密码:</td>
				<td><input type="text" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD}" maxlength="32" placeholder="这里输入密码" title="密码"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">真实姓名:</td>
				<td><input type="text" name="REALNAME" id="REALNAME" value="${pd.REALNAME}" maxlength="32" placeholder="这里输入真实姓名" title="真实姓名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">性别:</td>
				<td><input type="text" name="SEX" id="SEX" value="${pd.SEX}" maxlength="32" placeholder="这里输入性别" title="性别"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">生日:</td>
				<td><input type="text" name="BIRTHDAY" id="BIRTHDAY" value="${pd.BIRTHDAY}" maxlength="32" placeholder="这里输入生日" title="生日"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">城市:</td>
				<td><input type="text" name="CITY" id="CITY" value="${pd.CITY}" maxlength="32" placeholder="这里输入城市" title="城市"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">身高:</td>
				<td><input type="text" name="HIGHT" id="HIGHT" value="${pd.HIGHT}" maxlength="32" placeholder="这里输入身高" title="身高"/></td>
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
				<td><input type="text" name="WORKS" id="WORKS" value="${pd.WORKS}" maxlength="32" placeholder="这里输入职业" title="职业"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否有婚姻史:</td>
				<td><input type="text" name="ISMARRIED" id="ISMARRIED" value="${pd.ISMARRIED}" maxlength="32" placeholder="这里输入是否有婚姻史" title="是否有婚姻史"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">一句话说明:</td>
				<td><input type="text" name="MYDESC" id="MYDESC" value="${pd.MYDESC}" maxlength="32" placeholder="这里输入一句话说明" title="一句话说明"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">头像:</td>
				<td><input type="text" name="HEADIMG" id="HEADIMG" value="${pd.HEADIMG}" maxlength="32" placeholder="这里输入头像" title="头像"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">手机号:</td>
				<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="32" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">微信号:</td>
				<td><input type="text" name="WEIXIN" id="WEIXIN" value="${pd.WEIXIN}" maxlength="32" placeholder="这里输入微信号" title="微信号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">QQ:</td>
				<td><input type="text" name="QQ" id="QQ" value="${pd.QQ}" maxlength="32" placeholder="这里输入QQ" title="QQ"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">用户状态:</td>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入用户状态" title="用户状态"/></td>
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