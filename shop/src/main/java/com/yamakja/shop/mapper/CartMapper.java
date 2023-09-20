package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.CartItem;

import org.apache.ibatis.annotations.Mapper;

import java.math.BigInteger;
import java.util.List;

@Mapper
public interface CartMapper {
    void addCartItem(CartItem cartItem);
    List<Integer> getCartIdByMemberId(String memberId);
    Cart getItemsByCartItemId(int itemId,String memberId);
    Integer hasItem(String memberId, int itemId);
    void updateCartItem(CartItem cartItem);
<<<<<<< HEAD
    Integer totalPrice(String memberId);
=======
    void updateCartItemByCart(Cart cart,String memberId);
    BigInteger totalPrice(String memberId);
    Integer getQuantityById(int itemId,String memberId);
    void deleteCart(int cartId, String memberId);

    Boolean hasCart(String memberId,Integer itemId);
>>>>>>> cbb5d2f643b54ae0551b96932a48e7e57cf74fe6
}