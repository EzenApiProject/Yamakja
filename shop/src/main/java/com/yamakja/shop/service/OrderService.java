package com.yamakja.shop.service;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.OrderList;
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

    public void saveOrder(String memberId,List<Cart> carts) throws Exception{
        orderMapper.saveOrder(memberId,carts);
    }
    public List<OrderList> getOrderList(String memberId) throws Exception {
        List<OrderList> order = orderMapper.getOrderList(memberId);
        log.info(order.toString());
        return order;
    }
}
