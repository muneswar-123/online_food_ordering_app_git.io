package com.foodapplication.controller.showmenu;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapplication.model.daoimpl.MenuDaoImp;
import com.foodapplication.model.model.Menu;

public class ShowMenu extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imageRequest = req.getParameter("imageRequest");

        // If imageRequest is present, serve image
        if (imageRequest != null) {
            try {
                int menuId = Integer.parseInt(req.getParameter("menuId"));
                serveImage(menuId, resp);
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid menuId parameter.");
            }
            return;
        }

        // Otherwise, retrieve the menu list and forward to menu.jsp
        int restaurantId = Integer.parseInt(req.getParameter("restaurant_id"));
        MenuDaoImp mdi = new MenuDaoImp();
        List<Menu> menuList = mdi.getMenu(restaurantId);

        req.getSession().setAttribute("menuList", menuList);
        resp.sendRedirect("menu.jsp");
    }

    private void serveImage(int menuId, HttpServletResponse resp) throws IOException {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodclone", "root", "Muneswar@123")) {
            String query = "SELECT image FROM menu WHERE menu_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, menuId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("image");

                // If image data is null, send a 404 error
                if (imageData == null) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found for the given menuId.");
                    return;
                }

                // Set the content type and write the image data to response output stream
                resp.setContentType("image/jpeg"); // Adjust content type if necessary (e.g., image/png)
                try (OutputStream out = resp.getOutputStream()) {
                    out.write(imageData);
                }
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Menu item with the specified menuId not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving image from the database.");
        }
    }
}
