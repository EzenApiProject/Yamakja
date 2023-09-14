package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Item;
import com.yamakja.shop.service.CartService;
import com.yamakja.shop.service.ItemService;
import com.yamakja.shop.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static com.fasterxml.jackson.databind.type.LogicalType.Map;

@Slf4j
@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private MemberService memberService;

    @GetMapping("/cart")
    public String loadCart(Model model,@AuthenticationPrincipal OAuth2User oauthUser){
        String memberId = getMemberId(oauthUser);
        model.addAttribute("carts",cartService.getItemsByMemberId(memberId));
        return"/cart";
    }

    @PostMapping("/addCart")
    public String addCart(@RequestParam("itemId") int itemId,int quantity,@AuthenticationPrincipal OAuth2User oauthUser){
        log.info(String.valueOf(itemId));
        log.info(String.valueOf(quantity));
        String memberId = getMemberId(oauthUser);
        log.info(memberId);
        cartService.addCartItem(itemId,memberId,quantity);
        return "redirect:/";
    }

    @GetMapping("/pay")
    public String readyPay(Model model,@AuthenticationPrincipal OAuth2User oauthUser) {
        String memberId = getMemberId(oauthUser);
        model.addAttribute("carts", cartService.getItemsByMemberId(memberId));
        model.addAttribute("total",cartService.getTotal(memberId));
        model.addAttribute("member",memberService.getUserById(memberId));
        return "/pay";
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

