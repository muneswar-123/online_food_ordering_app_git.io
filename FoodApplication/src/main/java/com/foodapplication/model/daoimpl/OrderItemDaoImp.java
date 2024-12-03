package com.foodapplication.model.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.foodapplication.model.dao.OrderItemDao;
import com.foodapplication.model.model.CartItems;
import com.foodapplication.model.model.OrderItem;
import com.my.connect.MyConnection;

public class OrderItemDaoImp implements OrderItemDao {

	private static final String INSERT_QUERY = "insert into `order_items` (`orderId`, `menuId`, `quantity`, `price`, `item_total`) values(?, ?, ?, ?, ?)";
	private static final String FETCH_ALL = "select * from order_items where orderId = ?";
	private Connection con;
	private ResultSet result;
	List<OrderItem> orderItemList = new ArrayList<OrderItem>();

	public OrderItemDaoImp() {
		con = MyConnection.connect();
	}
	
	@Override
	public void insertAll(Map<Integer, CartItems >cart , int orderId) {
		try(PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY)) {
			
			for(CartItems cartItems : cart.values()) {
				pstmt.setInt(1, orderId);
				pstmt.setInt(2, cartItems.getMenu_id());
				pstmt.setInt(3, cartItems.getQuantity());
				pstmt.setInt(4, cartItems.getPrice());				
				pstmt.setInt(5, cartItems.getQuantity() * cartItems.getPrice());
				pstmt.addBatch();
			}
			pstmt.executeBatch();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> fetchAll(int id) {
		try(PreparedStatement pstmt = con.prepareStatement(FETCH_ALL)) {
			pstmt.setInt(1, id);
			result = pstmt.executeQuery();
			orderItemList = extractOrderItemListFromResult(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderItemList;
	}
	
	public List<OrderItem> extractOrderItemListFromResult(ResultSet result) {
		try {
			while(result.next()) {
				orderItemList.add(new OrderItem(result.getInt("order_itemId"),
						result.getInt("orderId"),
						result.getInt("menuId"),
						result.getInt("quantity"),
						result.getInt("price"),
						result.getInt("item_total")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderItemList;
	}

}
