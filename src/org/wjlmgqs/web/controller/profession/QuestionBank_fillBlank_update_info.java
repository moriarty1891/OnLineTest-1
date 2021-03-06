/**
 **作者：翁加林
 **时间：2012-8-21
 **文件名：QuestionBank_fillBlank_update_info.java
 **包名：org.wjlmgqs.web.controller.profession
 **工程名：OnLineTest15
 */

package org.wjlmgqs.web.controller.profession;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.wjlmgqs.daomain.FillBlank;
import org.wjlmgqs.daomain.Knowledge;
import org.wjlmgqs.daomain.Teacher;
import org.wjlmgqs.enums.QuestionDifficultyType;
import org.wjlmgqs.service.impl.FillBlankServiceImp;
import org.wjlmgqs.service.impl.KnowledgeServiceImp;
import org.wjlmgqs.web.util.BeanValidateUtil;

public class QuestionBank_fillBlank_update_info extends HttpServlet {

	private static final long serialVersionUID = 3338821978332043613L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String showMessage = null;
		String fillBlankId = request.getParameter("fillBlankId");
		String content = request.getParameter("content");
		String[] results = request.getParameterValues("results");
		String difficulty = request.getParameter("difficulty");
		String knowledgeId = request.getParameter("knowledgeId");
		String analyse = request.getParameter("analyse");
		
		Teacher teacher = null;
		QuestionDifficultyType difficultyType = null;
		Knowledge knowledge = null;
		// 检测格式及正确性
		int fillBlank_id = -1;
		try {
			teacher = (Teacher) request.getSession().getAttribute("professionTeacher");
			fillBlank_id = Integer.parseInt(fillBlankId);
		} catch (Exception e) {}	
		try {
			int index_difficulty = Integer.parseInt(difficulty.trim());
			difficultyType = QuestionDifficultyType.values()[index_difficulty];
		} catch (Exception e) {}	
		try {
			int knowledge_id = Integer.parseInt(knowledgeId);
			KnowledgeServiceImp knowledgeServiceImp = new KnowledgeServiceImp(); 
			knowledge = knowledgeServiceImp.getknowledgeById(knowledge_id,teacher);
		} catch (Exception e) {}
		showMessage = BeanValidateUtil.validatorOnlyVoPropertys(
				FillBlank.class,
				new String[]{"id","content","results","difficulty","knowledge","analyse"},
				new Object[]{fillBlank_id,content,results,difficultyType,knowledge,analyse});
		if (showMessage == null) {
			if (showMessage == null) {
				String divisionSign = request.getSession().getServletContext().getInitParameter("divisionSign");
				//将上传的空格项重组：取出中间的空白项和多余的分隔符，并检测时候是空白项
				String[] rs = new String[results.length-1];
				for(int i = 1;i<results.length;i++) {
					String r = results[i];
					String[] temp = r.split(divisionSign);//每一行空格
					String appT = "";//重组后的每一行
					for(int j=0;j<temp.length;j++) {
						if(temp[j].trim().equals("")) {//如果行中某项为空，则舍弃该项
						}else {
							appT+=temp[j].trim()+divisionSign;
						}
					}
					if(!appT.trim().equals("")) {//检测重组后的内容是否空
						int index = appT.lastIndexOf(divisionSign);//if中的判断条件保证index>=1
						appT = appT.substring(0,index);//取出尾巴上的分隔符
					}else {
						showMessage = "错误信息：试题空格不能为空！";
						break;
					}
					rs[i-1] = appT;
				}
				if (showMessage == null) {
					FillBlankServiceImp fillBlankService = new FillBlankServiceImp();
					FillBlank fillBlank = fillBlankService.getFillBlankById(fillBlank_id, teacher);
					if (fillBlank != null) {
						fillBlank.setAnalyse(analyse);
						fillBlank.setContent(content);
						fillBlank.setCreateTime(new Date());
						fillBlank.setDifficulty(difficultyType);
						fillBlank.setKnowledge(knowledge);
						fillBlank.setResults(rs);
						showMessage = fillBlankService.updateFillBlank(fillBlank);
					} else {
						showMessage = "错误信息：指定试题不存在！";
					}
				}
			}
		}
		request.setAttribute("showMessage", showMessage);
		request.getRequestDispatcher("/teacher/profession/questionBank_fillBlank_update?fillBlankId="
						+ fillBlankId).forward(request, response);
	}

}
