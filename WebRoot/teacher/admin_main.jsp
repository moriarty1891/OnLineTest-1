<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head> 
		<title>管理员用户主界面</title>
	</head>
	<frameset cols="230,*" frameborder="no" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/teacher/admin_main_leftMenu" scrolling="no" name="adminLeftMenu" border="0" noresize="noresize"/>
		<frame src="${pageContext.request.contextPath}/teacher/admin_main_rightShow" name="adminRightShow" scrolling="yes" noresize="noresize" />
	</frameset>
</html>