/**
 **作者：翁加林
 **时间：2012-7-25
 **文件名：Admin_account_profession_delete.java
 **包名：org.wjlmgqs.web.controller
 **工程名：OnLineTest03
 */

package org.wjlmgqs.web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.wjlmgqs.daomain.Teacher;
import org.wjlmgqs.service.impl.ProfessionServiceImp;
import org.wjlmgqs.web.util.BeanValidateUtil;

public class Account_profession_delete extends HttpServlet {

	private static final long serialVersionUID = 6522036080079517966L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String showMessage = null;
		String userId = request.getParameter("userId");
		// 验证客户端资料
		showMessage = BeanValidateUtil.validatorVoProperty(Teacher.class,"userId",userId);
		if (showMessage == null) {
			// 数据库信息核对成功后删除，并返回删除结果
			ProfessionServiceImp professionService = new ProfessionServiceImp(); 
			showMessage = professionService.deleteProfessionById(userId);
		}
		request.setAttribute("showMessage", showMessage);
		request.getRequestDispatcher("/teacher/admin/account_profession")
				.forward(request, response);
	}
}
