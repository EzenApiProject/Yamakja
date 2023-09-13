package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Member;
import com.yamakja.shop.service.ItemService;
import com.yamakja.shop.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class AdminController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private MemberService memberService;

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
        return"/table_newsAdmin";
    }

    @GetMapping("/orderAdmin")
    public String orderAdmin(Model model){
        return"/table_orderAdmin";
    }

}
