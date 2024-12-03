package com.foodapplication.controller.showorderitems;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapplication.model.daoimpl.OrderItemDaoImp;
import com.foodapplication.model.model.OrderItem;

public class ShowOrderItems extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int  orderId = Integer.parseInt(req.getParameter("orderId"));
		
		OrderItemDaoImp odi = new OrderItemDaoImp();
		List<OrderItem> orderItemList  = odi.fetchAll(orderId);
		req.getSession().setAttribute("orderItemList", orderItemList);
		resp.sendRedirect("orderdetails.jsp");
	}
}
