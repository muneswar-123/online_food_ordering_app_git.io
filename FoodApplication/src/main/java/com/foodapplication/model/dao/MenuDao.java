package com.foodapplication.model.dao;

import java.util.List;

import com.foodapplication.model.model.Menu;

public interface MenuDao {
	void insertAll(Menu menu);
	List<Menu> fetchAll();
	List<Menu> getMenu(int id );
	void update(int id , int price);
	void delete(int id );
	Menu getMenuById(int id );
}

