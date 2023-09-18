package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.Item;
import com.yamakja.shop.domain.Member;
import com.yamakja.shop.domain.OrderList;
import com.yamakja.shop.service.CartService;
import com.yamakja.shop.service.ItemService;
import com.yamakja.shop.service.MemberService;
import com.yamakja.shop.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final CartService cartService;
    private final ItemService itemService;
    private final MemberService memberService;

    @GetMapping("/myPage")
    public String getOrder(Model model, @AuthenticationPrincipal OAuth2User oauthUser) throws Exception {
        String memberId = getMemberId(oauthUser);
        List<OrderList> orderIndex = orderService.getOrderList(memberId);
        List<Item> order = new ArrayList<>();
        for(int i=0;i<orderIndex.size();i++){
            order.add(itemService.getItemById(orderIndex.get(i).getItemID()));
        }
        Member member = memberService.getUserById(memberId);
        log.info(orderIndex.toString());
        log.info(order.toString());
        model.addAttribute("orderIndex", orderIndex);
        model.addAttribute("orderItem", order);
        model.addAttribute("member",member);
        return "/myPage";
    }


    @GetMapping("/addOrder")
    public String makeOrder(@AuthenticationPrincipal OAuth2User oauthUser) throws Exception{
        String memberId = getMemberId(oauthUser);
        List<Cart> carts = cartService.getItemsByMemberId(memberId);
        orderService.saveOrder(memberId,carts);
        return "redirect:/myPage";
    }

    public OrderList recentOrder(List<OrderList> orders){
        OrderList order = null;
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
