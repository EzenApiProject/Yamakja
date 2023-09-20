package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Cart;
import com.yamakja.shop.domain.Item;
import com.yamakja.shop.service.CartService;
import com.yamakja.shop.service.ItemService;
import com.yamakja.shop.service.MemberService;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

import static com.fasterxml.jackson.databind.type.LogicalType.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class CartController {


    private final CartService cartService;
    private final MemberService memberService;
    private final ItemService itemService;

    @GetMapping("/cart")
    public String loadCart(Model model,@AuthenticationPrincipal OAuth2User oauthUser){
        String memberId = getMemberId(oauthUser);
        model.addAttribute("carts",cartService.getItemsByMemberId(memberId));
        return"/cart";
    }

    @PostMapping("/addCart")
    public String addCart(Model model, @RequestParam("itemId") int itemId,Boolean direct,int quantity,@AuthenticationPrincipal OAuth2User oauthUser){
        String memberId = getMemberId(oauthUser);
        Item item = itemService.getItemById(itemId);
        Cart cart = Cart.builder()
                .itemId(itemId)
                .name(item.getName())
                .price(item.getPrice())
                .category(item.getCategory())
                .fPath(item.getFPath())
                .fName((item.getFName()))
                .quantity(quantity)
                .build();
        List<Cart> carts = new ArrayList<>();
        carts.add(cart);
        if(direct.equals(true)){
            model.addAttribute("carts", carts);
            model.addAttribute("total", itemService.getItemById(itemId).getPrice() * quantity);
            model.addAttribute("member",memberService.getUserById(memberId));
            return "/pay";
        }else{
            cartService.addCartItem(itemId,memberId,quantity);
            return "redirect:/cart";
        }
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

