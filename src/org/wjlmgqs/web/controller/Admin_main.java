/**
 **作者：翁加林
 **时间：2012-7-21
 **文件名：Admin_main.java
 **包名：org.wjlmgqs.web.controller
 **工程名：OnLineTest01
 */

package org.wjlmgqs.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin_main extends HttpServlet {
	private static final long serialVersionUID = -4658743039261689765L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/teacher/admin_main.jsp").forward(request, response);
	}
}
