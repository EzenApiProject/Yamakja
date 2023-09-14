package com.yamakja.shop.service;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.Order;
import com.yamakja.shop.domain.OrderDetail;
import com.yamakja.shop.domain.OrderItem;
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

    public void saveOrder(Order order) throws Exception{
        orderMapper.saveOrder(order);
    }
    public List<Order> getOrder(String memberId) throws Exception {
        List<Order> order = orderMapper.getOrder(memberId);
        log.info(order.toString());
        return order;
    }
    public List<OrderItem> getOrderList(Order order) throws Exception {
        List<OrderItem> orderItemList = orderMapper.getOrderList(order);
        log.info(orderItemList.toString());
        return orderItemList;
    }

    public void addOrderDetail(Order order, List<Cart> carts) throws Exception{
        for(int i=0;i<carts.size();i++){
            log.info(order.toString());
            log.info(carts.get(i).toString());
            orderMapper.addOrderDetail(order,carts.get(i));
        }
    }
}
