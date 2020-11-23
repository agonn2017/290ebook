package com.ebook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UtilMessage {

	public static void message(HttpServletRequest request,HttpServletResponse response,String message){
		try{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
	      System.out.print(11111111);
	      String msg = "alert( '"+message+"');window.localhost.href='${pageContext.request.contextPath}/ec/findEntryPagingController.html'";
	      writer.print("<script type='text/javascript'>" + msg + "</script>");
			writer.flush();
			writer.close();
		}catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
