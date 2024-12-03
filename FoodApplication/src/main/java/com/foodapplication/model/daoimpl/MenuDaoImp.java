package com.foodapplication.model.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapplication.model.dao.MenuDao;
import com.foodapplication.model.model.Menu;


public class MenuDaoImp implements MenuDao {
	
	List<Menu> menuList = new ArrayList<Menu>();
	private static final String INSERT_QUERY = "insert into `menu`(`restaurant_id`, `menu_name`, `menu_description`, `price`, `rating`, `image`) values (?, ?, ?, ?, ?, ?)";
	private static final String CHECK_RID_QUERY = "SELECT COUNT(*) FROM `restaurant` WHERE `restaurant_id` = ?";
	private static final String FETCH_ALL_QUERY = "select * from menu";
	private static final String FETCH_SPECIFIC = "select * from `menu` where `restaurant_id` = ?";
	private static final String FETCH_BY_ID = "select * from `menu` where `menu_id` = ?";
	private static final String UPDATE_QUERY = "update menu set price = ? where menu_id = ?";
	private static final String DELETE_QUERY = "delete from menu where menu_id = ?";
	private Connection con;
	private String url = "jdbc:mysql://localhost:3306/foodclone";;
	private String username = "root";
	private String password = "Muneswar@123";
	private PreparedStatement pstmt;
	private int res;
	private ResultSet result;
	private Menu s;

	public MenuDaoImp() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private boolean isRidExists(int rid) {
        try (PreparedStatement checkStmt = con.prepareStatement(CHECK_RID_QUERY)) {
            checkStmt.setInt(1, rid);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

	@Override
	public void insertAll(Menu menu) {
		try {
			if (!isRidExists(menu.getRid())) {
                System.out.println("The specified rid does not exist in the restaurant table.");
                return;
            }
		
			pstmt = con.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1, menu.getRid());
			pstmt.setString(2, menu.getName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setInt(4, menu.getPrice());
			pstmt.setInt(5, menu.getRating());
			pstmt.setBytes(6, menu.getImage());
			
			res = pstmt.executeUpdate();
			if(res!=0) {
				System.out.println("Data Inserted");
			}
			else 
				System.out.println("Not Inserted");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public List<Menu> fetchAll() {
		try {
			pstmt = con.prepareStatement(FETCH_ALL_QUERY);
			result = pstmt.executeQuery();
			menuList = extractMenuListFromResultSet(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}
	
	public List<Menu> extractMenuListFromResultSet(ResultSet result) {
		try {
			while(result.next()) {
				menuList.add(new Menu(
						 result.getInt("menu_id"),
	                        result.getInt("restaurant_id"),
	                        result.getString("menu_name"),
	                        result.getString("menu_description"),
	                        result.getInt("price"),
	                        result.getInt("rating"),
	                        result.getString("is_available"),
	                        result.getBytes("image")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menuList;
	}
	@Override
	public List<Menu> getMenu(int restaurant_id ) {
		try {
			pstmt = con.prepareStatement(FETCH_SPECIFIC);
			pstmt.setInt(1, restaurant_id);
			result = pstmt.executeQuery();
			menuList = extractMenuListFromResultSet(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}
	@Override
	public Menu getMenuById(int id) {
        try (PreparedStatement pstmt = con.prepareStatement(FETCH_BY_ID)) {
            pstmt.setInt(1, id);
            try (ResultSet result = pstmt.executeQuery()) {
                if (result.next()) {
                    return new Menu(
                            result.getInt("menu_id"),
                            result.getInt("restaurant_id"),
                            result.getString("menu_name"),
                            result.getString("menu_description"),
                            result.getInt("price"),
                            result.getInt("rating")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
	@Override
	public void update(int id , int price) {
		try {
			pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(2, id);
			pstmt.setInt(1, price);
			res = pstmt.executeUpdate();
			if(res != 0)
				System.out.println("Updated Successful");
			else {
				System.out.println("No record");
			 	System.exit(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void delete(int id ) {
		try {
			pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, id);
			res = pstmt.executeUpdate();
			if(res != 0)
				System.out.println("Row deleted successfully");
			else {
				System.out.println("No Record!");
				System.exit(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

