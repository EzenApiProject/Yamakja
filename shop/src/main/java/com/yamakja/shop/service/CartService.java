package com.yamakja.shop.service;

import com.yamakja.shop.domain.CartItem;
import com.yamakja.shop.domain.Item;
import com.yamakja.shop.mapper.CartMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class CartService {

    @Autowired
    private CartMapper cartMapper;

//    public Map<CartItem,Integer> loadMemberCartItem(String memberId){
//        Map<Item,Integer> cartList = cartMapper.loadCartItem(memberId);
//        log.info(cartList.toString());
//        return cartList;
//    }

    public void addCartItem(int cartItemId, String cartMemberId, int quantity){
        CartItem cartItem = CartItem.builder()
                        .cartItemId(cartItemId)
                        .cartMemberId(cartMemberId)
                        .quantity(quantity)
                        .build();
        log.info(cartItem.toString());
        cartMapper.addCartItem(cartItem);
    }
}
