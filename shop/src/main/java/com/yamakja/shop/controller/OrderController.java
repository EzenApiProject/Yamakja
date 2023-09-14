package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.Order;
import com.yamakja.shop.domain.OrderItem;
import com.yamakja.shop.service.CartService;
import com.yamakja.shop.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpRequest;
import java.util.Collections;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final CartService cartService;
    @GetMapping("/order")
    public String getOrder(Model model, @AuthenticationPrincipal OAuth2User oauthUser) throws Exception {
        String memberId = getMemberId(oauthUser);
        List<Order> orders = orderService.getOrder(memberId);
        List<List<OrderItem>> orderItemList = null;
        for (int i = 0; i < orders.size(); i++) {
            orderItemList = orderService.getOrderList(orders.get(i));
        }
        model.addAttribute("orders", orders);
        model.addAttribute("orderList", orderItemList);
        return "/order";
    }


    @GetMapping("/addOrder")
    public String makeOrder(@AuthenticationPrincipal OAuth2User oauthUser) throws Exception{
        String memberId = getMemberId(oauthUser);
        List<Cart> carts = cartService.getItemsByMemberId(memberId);
        Order inputOrder = Order.builder().status("주문확인중").memberId(memberId).build();
        orderService.saveOrder(inputOrder);
        List<Order> outputOrder = orderService.getOrder(memberId);
        Order order = recentOrder(outputOrder);
        orderService.addOrderDetail(order,carts);
        return "redirect:/order";
    }

    public Order recentOrder(List<Order> orders){
        Order order = null;
        for(int i=0;i<(orders.size() - 1);i++){
            int result = orders.get(i).getCreatedAt().compareTo(orders.get(i+1).getCreatedAt());
            if(result < 0){
                order = orders.get(i+1);
            }else{
                order = orders.get(i);
            }
        }
        return order;
    }

    public String getMemberId(OAuth2User oauthUser){
        String memberId;
        if(oauthUser != null){
            memberId = (String)oauthUser.getAttributes().get("email");
        }else{
            memberId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        }
        return memberId;
    }
}
