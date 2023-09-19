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
    BigInteger totalPrice(String memberId);
}