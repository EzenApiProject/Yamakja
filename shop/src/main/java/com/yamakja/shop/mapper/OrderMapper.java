package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.OrderList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface OrderMapper {
    void saveOrder(String memberId,List<Cart> carts) throws Exception;
    List<OrderList> getOrderList(String memberId) throws Exception;
}
