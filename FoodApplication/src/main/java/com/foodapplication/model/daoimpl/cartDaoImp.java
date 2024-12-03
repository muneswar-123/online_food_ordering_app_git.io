package com.foodapplication.model.daoimpl;

import java.util.Map;
import com.foodapplication.model.model.CartItems;

public class cartDaoImp {

    // Add item to cart or update quantity if item already exists
    public Map<Integer, CartItems> addItem(Map<Integer, CartItems> cart, CartItems item) {
        int menuId = item.getMenu_id();
        
        if (cart.containsKey(menuId)) {
            CartItems existingItem = cart.get(menuId);
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            cart.put(menuId, item);
        }
        return cart;
    }

    // Update item quantity in the cart
    public Map<Integer, CartItems> updateItem(Map<Integer, CartItems> cart, int menuId, int quantity) {
        if (cart.containsKey(menuId)) {
            // Validate quantity
            if (quantity <= 0) {
                // You can log the invalid quantity and return the cart without changes
                System.out.println("Invalid quantity: " + quantity);
                return cart;
            }
            cart.get(menuId).setQuantity(quantity);
        }
        return cart;
    }
    
    // Remove item from the cart
    public Map<Integer, CartItems> removeItem(Map<Integer, CartItems> cart, int menuId) {
        if (cart.containsKey(menuId)) {
            cart.remove(menuId);
        } else {
            // Optionally log if item was not found
            System.out.println("Item with menuId " + menuId + " not found in cart.");
        }
        return cart;
    }
}
