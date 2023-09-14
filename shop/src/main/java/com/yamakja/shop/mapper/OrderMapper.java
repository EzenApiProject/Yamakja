package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.OrderDetail;
import com.yamakja.shop.domain.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.yamakja.shop.domain.Order;
import java.util.List;

@Mapper
@Repository
public interface OrderMapper {
    void saveOrder(Order order) throws Exception;
    List<Order> getOrder(String memberId) throws Exception;
    List<OrderItem> getOrderList(Order order) throws Exception;
    void addOrderDetail(Order order,Cart cart) throws Exception;
}
