package com.yamakja.shop.service;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.OrderList;
import com.yamakja.shop.mapper.CartMapper;
import com.yamakja.shop.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderMapper orderMapper;
    private final CartMapper cartMapper;

    public void saveOrder(String memberId,List<Cart> carts) throws Exception{
        for(Cart cart : carts){
            if(cartMapper.hasCart(memberId,cart.getItemId())){
                log.info(cartMapper.getQuantityById(cart.getItemId(),memberId).toString());
                log.info(String.valueOf(cart.getQuantity()));
                if(cartMapper.getQuantityById(cart.getItemId(),memberId) > cart.getQuantity()){
                    cartMapper.updateCartItemByCart(cart,memberId);
                }else{
                    cartMapper.deleteCart(cart.getItemId(),memberId);
                }
            }
        }
        log.info(carts.toString());
        orderMapper.saveOrder(memberId,carts);
    }
    public List<OrderList> getOrderList(String memberId) throws Exception {
        List<OrderList> order = orderMapper.getOrderList(memberId);
        log.info(order.toString());
        return order;
    }

    public List<OrderList> getOrderListAll(String memberId) throws Exception{
        return orderMapper.getOrderListAll(memberId);
    }
}
