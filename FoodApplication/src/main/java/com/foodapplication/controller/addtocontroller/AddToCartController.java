package com.foodapplication.controller.addtocontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapplication.model.daoimpl.MenuDaoImp;
import com.foodapplication.model.daoimpl.cartDaoImp;
import com.foodapplication.model.model.CartItems;
import com.foodapplication.model.model.Menu;

public class AddToCartController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Map<Integer, CartItems> cart = (Map<Integer, CartItems>) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        MenuDaoImp mdi = new MenuDaoImp();
        Menu m = mdi.getMenuById(menuId);

        cartDaoImp cartDao = new cartDaoImp();
        cart = cartDao.addItem(cart, new CartItems(menuId, m.getRid(), m.getName(), quantity, m.getPrice()));

        // Store the updated cart in the session
        req.getSession().setAttribute("cart", cart);

        // Set a success message to display on the page
        req.setAttribute("message", "Item added to cart successfully!");
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }
}
