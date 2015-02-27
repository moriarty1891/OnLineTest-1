<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <%--设置窗体右边显示界面的基本样式--%>  
 	<link media="screen" type="text/css" href="${pageContext.request.contextPath}/css/showRightStyle.css"	rel="stylesheet" />
  	<%--使用jquery必须导入--%>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
 	<%--消息对话框框架--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.alerts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.draggable.js"></script>
	<link href="${pageContext.request.contextPath}/css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
	<%--创建和更新时所在的层的伸缩--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hiddenDivContent.js"></script>
  	<link href="${pageContext.request.contextPath}/css/style_divHidden.css" rel="stylesheet" type="text/css" />
  	<%-- 图片放大显示插件--%>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.imagePreview.1.0.js"></script>
	<%-- 绑定图片错误显示时的处理函数和代替图片--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bindSimpleImageView.js"></script>
 	<%-- 显示试题的显示样式--%>
	<link href="${pageContext.request.contextPath}/css/style_question.css" rel="stylesheet" type="text/css"  />
	<%-- 动态为图片列表赋值以添加放大效果--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/setListImageLink.js"></script>
  </head>
 <body>
 <center>
 	<h1>${professionTeacher.subject.code}-多选题</h1>
 	<a href="${pageContext.request.contextPath}/teacher/profession/paper_multiples_add">添加新试题</a>
 	<a href="${pageContext.request.contextPath}/teacher/profession/paper_update">返回到试卷头部</a>
<hr/>

	<c:forEach items="${multiples}" var="multiple" varStatus="status" step="1" >
		<div id="showMultipleItem" class="defineTop" >
			<div><h4 align="center">第${status.count}题</h4></div>
				<div class="defineBase">
				<div>		
					<fieldset>
						<legend>内容：</legend>
						<textarea rows="4" cols="55" id="content" disabled="disabled">${multiple.content}</textarea>
					</fieldset>	
				</div>
				<div>
						选项：<table id="checkBoxTable" border='1' width='480px'>
								<tr><td>序号</td><td>选项内容</td><td>答案</td></tr>
								<c:forEach items="${multiple.choices}" varStatus="stS" var="choice">
									<tr>
										<td style="text-align:center" width='36'>${stS.count}</td>
										<td><input type="text" value="${choice}" disabled="disabled" /></td>
										<td style="text-align:center" width='36'><input type="checkbox" ${multiple.results[stS.count-1]=='1'?'checked':''  } /></td>
									</tr>
								</c:forEach>
							 </table>
				</div>
				<div>	难度：<input id="difficulty" value="${multiple.difficulty.name}" type="text" size="2" disabled="disabled"/>
									&nbsp;&nbsp;
								创建时间：<fmt:formatDate value="${multiple.createTime}" pattern="yy/MM/dd HH:mm:ss"/></div>	
				<div>
					<fieldset>
						<legend>分析：</legend>
						<textarea id="analyse" rows="4" cols="55"  disabled="disabled">${multiple.analyse}</textarea>
					</fieldset>	
				</div>		
				<div>	
					图片 <a id="floatImage" target="_blank" class="preview" title="单选试题图片">
							<img id="questionImage"  width='30px' height='30px' />
							<%--这里动态记录对应的试题图片路径，然后由jquery动态赋值--%>
							<input type="hidden" class="imageLink" value="${pageContext.request.contextPath}/questionBankImage/${multiple.image}"/>
						</a>
				</div>	
			</div>
		</div>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
	</c:forEach>
	
 </center>
  </body>
</html>
<%@ include file="/jspf/showMessageContent.jspf" %>