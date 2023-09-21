package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Member;
import com.yamakja.shop.domain.OrderList;
import com.yamakja.shop.mapper.OrderMapper;
import com.yamakja.shop.service.ItemService;
import com.yamakja.shop.service.MemberService;
import com.yamakja.shop.service.NewsService;
import com.yamakja.shop.service.OrderService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.Comparator;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AdminController {

    private final ItemService itemService;
    private final MemberService memberService;
    private final NewsService newsService;
    private final OrderService orderService;

    @GetMapping("/admin")
    public String dashboard(Model model){
        return"/dashboard";
    }

    @GetMapping("/faqAdmin")
    public String faqAdmin(Model model){
        return"/table_faqAdmin";
    }

    @GetMapping("/itemAdmin")
    public String itemAdmin(Model model){
        model.addAttribute("items",itemService.getItems());
        itemService.getItems();
        return"/table_itemAdmin";
    }

    @GetMapping("/memberAdmin")
    public String memberAdmin(Model model){
        model.addAttribute("members",memberService.getUserList());
        memberService.getUserList();
        return"/table_memberAdmin";
    }

    @GetMapping("/newsAdmin")
    public String newsAdmin(Model model){
        model.addAttribute("news",newsService.getNews());
        return"/table_newsAdmin";
    }

    @GetMapping("/orderAdmin")
    public String orderAdmin(Model model) throws Exception {
        List<OrderList> orderList1 = new ArrayList<OrderList>();
        List<OrderList> orderList2 = new ArrayList<OrderList>();
        List<Member> memberList = memberService.getUserList();
        for (Member member : memberList) {
            orderList1 = orderService.getOrderList(member.getId());
            for (OrderList orderList : orderList1){
                orderList2.add(orderList);
            }
        }

        orderList2 = orderlistSort(orderList2);

        model.addAttribute("orderlistAll", orderList2);
        model.addAttribute("items",itemService.getItems());
        return"/table_orderAdmin";
    }

    // orderlist를 기준으로 정렬하는 Comparator 구현
    public List<OrderList> orderlistSort(List<OrderList> orderList){

        Comparator<OrderList> comparator = new Comparator<OrderList>() {
            @Override
            public int compare(OrderList obj1, OrderList obj2) {
                return Integer.compare(obj1.getOrderId(), obj2.getOrderId());
            }
        };

        // 리스트 정렬
        Collections.sort(orderList, comparator);
        return orderList;
    }

    
}
