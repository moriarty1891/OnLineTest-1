<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.wjlmgqs.daomain.Teacher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <%--设置窗体右边显示界面的基本样式--%>  
 	<link media="screen" type="text/css" href="${pageContext.request.contextPath}/css/showRightStyle.css"	rel="stylesheet" />
	<%--使用jquery必须导入--%>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
	<%--验证框架框架--%>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easy_validator.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.bgiframe.min.js"></script>
	<link  href="${pageContext.request.contextPath}/css/validate_failed.css" rel="stylesheet" type="text/css" />
	<%--消息对话框框架--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.alerts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.draggable.js"></script>
	<link href="${pageContext.request.contextPath}/css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
	<%--显示确认对话框框（基于框架实现）--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showConfirmDialog.js"></script>
	<%--ajax异步消息函数--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/optionAjax.js"></script>
	<%--试题创建和更新时所在的层的伸缩--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hiddenDivContent.js"></script>
  	<link href="${pageContext.request.contextPath}/css/style_divHidden.css" rel="stylesheet" type="text/css" />
	 <%--表格框架--%>
  	<style type="text/css" title="currentStyle">
			@import "${pageContext.request.contextPath}/css/demo_page.css";
			@import "${pageContext.request.contextPath}/css/jquery.dataTables.css";
	</style>	
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"  ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/loadTableAble.js"></script>
	</head>
 <body >
 <center>
 	<h1>学生信息管理</h1>
	<!-- 收缩展开效果 -->
	<div class="hiddenDiv">
		<div class="hiddenTitle"><h3>创建新学生</h3></div>
		<div class="hiddenContent">
			<form action="${pageContext.request.contextPath}/teacher/admin/account_student_create" method="post">
				学院名称<select name="departmentId" id="departmentId" size="1" onchange="back2Default()"  tip="请选择学院" reg="[1-9]+">
							<option value="0" >----请选择以下学院----</option>
							<c:forEach items="${requestScope.departments}" var="department" step="1">
								<option value="${department.id}" }>${department.code}</option>
							</c:forEach>
					   </select>
				&nbsp;&nbsp;
				年级名称<select name="gradeId" id="gradeId" size="1" onchange="back2Default()"  tip="请选择年级" reg="[1-9]+">
							<option value="0">----请选择以下年级----</option>
							<c:forEach items="${requestScope.grades}" var="grade" step="1">
								<option value="${grade.id}" }>${grade.code}</option>
							</c:forEach>
					   </select>
				<input type="button" onclick="grade_Department2career()" value="查看专业"/>
				&nbsp;&nbsp;
			   	专业名称<select name="careerId" id="careerId" size="1" onchange="career2classes(this)"  tip="请点击查看专业并选择专业" reg="[1-9]+">
							<option value="0">----请选择以下专业----</option>
			  			</select>
			  	&nbsp;&nbsp;
			   	班级名称<select name="classId" id="classId" size="1"  tip="请选择班级" reg="[1-9]+">
							<option value="0">----请选择以下班级----</option>
			  			</select>
			  	<br/>
				学生编号<input type="text" name="userId" reg="\d{11}" tip="账号由11位数字组成！"/>
				
				账户状态<input type="radio" name="status" value="1" checked="checked"/>开启
						<input type=radio name="status" value="0"/>关闭
		
				<input type="submit" value="创建" />
			</form>
		</div>
	</div>
<hr/>
	<table cellpadding="5" cellspacing="0" border="1" class="display" id="eachRow" style="text-align: center" >
		<thead>
			<tr><th>学号</th><th>姓名</th><th>性别</th><th>专业</th><th>年级</th><th>学院</th><th>状态</th><th>操作</th></tr>
		</thead>
		<tbody>
			<c:forEach items="${students}" var="student" varStatus="status" step="1" >
				<tr>
					<td>${student.userId}</td>
					<td>${student.name}</td>
					<td>${student.sex=='1'?'男':'女'}</td>
					<td>${student.classes.career.code}</td>
					<td>${student.classes.career.grade.code}</td>
					<td>${student.classes.career.department.code}</td>
					<td>${student.status.name}</td>
					<td><a href="###" onclick="showConfirmDialog('account_student_delete?studentId=${student.userId}')" title="删除"><img src="${pageContext.request.contextPath}/images/icons/cross.png" alt="删除"/></a>
						&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/teacher/admin/account_student_update?studentId=${student.userId}" title="编辑"><img src="${pageContext.request.contextPath}/images/icons/pencil.png" alt="编辑"/></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
 </center>
  </body>
  
</html>
	<%@ include file="/jspf/hiddenDivContentStatus.jspf" %>
	<%@ include file="/jspf/showMessageContent.jspf" %>