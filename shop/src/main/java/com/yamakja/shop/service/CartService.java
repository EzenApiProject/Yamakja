package com.yamakja.shop.service;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.CartItem;
import com.yamakja.shop.domain.Item;
import com.yamakja.shop.mapper.CartMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class CartService {

    private final CartMapper cartMapper;


    public List<Cart> getItemsByMemberId(String memberId){
        List<Integer> cartItemId = cartMapper.getCartIdByMemberId(memberId);
        log.info(cartItemId.toString() + " cartItemID");
        List<Cart> carts = new ArrayList<>();
        for(int i=0; i<cartItemId.size();i++){
            log.info(cartMapper.getItemsByCartItemId(cartItemId.get(i),memberId).toString());
            carts.add(cartMapper.getItemsByCartItemId(cartItemId.get(i),memberId));
        }
        return carts;
    }

    public void addCartItem(int cartItemId, String cartMemberId, int quantity){

        Integer num = cartMapper.hasItem(cartMemberId,cartItemId);
        log.info(String.valueOf(num));
        if (num != null) {
            CartItem cartItem = CartItem.builder()
                    .cartItemId(cartItemId)
                    .cartMemberId(cartMemberId)
                    .quantity(num+quantity)
                    .build();
            log.info(cartItem.toString());
            cartMapper.updateCartItem(cartItem);
        }else{
            CartItem cartItem = CartItem.builder()
                    .cartItemId(cartItemId)
                    .cartMemberId(cartMemberId)
                    .quantity(quantity)
                    .build();
            log.info(cartItem.toString());
            cartMapper.addCartItem(cartItem);
        }
    }

    public Integer getTotal(String memberId){
        return cartMapper.totalPrice(memberId);
    }
}
