package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.CartItem;
import com.yamakja.shop.domain.Item;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface CartMapper {
    void addCartItem(CartItem cartItem);
}