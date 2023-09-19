package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Item;
import com.yamakja.shop.domain.ItemComment;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@Slf4j
public class ItemController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private MemberService memberService;


    @GetMapping("/addItem")
    public String goInsert(){
        return "addItem";
    }

    @PostMapping("/addItem")
    public String insertItem(Item item, MultipartFile file) throws IOException {
        itemService.insertItem(item,file);
        return "redirect:/itemList";
    }

    @GetMapping({"/itemList","/"})
    public String itemList(Model model){
        model.addAttribute("items",itemService.getItems());
        itemService.getItems();
        return"/itemList";
    }

    @GetMapping("/item/") // itemComment 관련해서는 여기에 추가
    public String item(Model model, @RequestParam("itemId") int itemId){
        model.addAttribute("item",itemService.getItemById(itemId));
        model.addAttribute("itemComment",itemService.getItemComments(itemId));
        model.addAttribute("items",itemService.getItems());
        log.info(itemService.getItemComments(itemId).toString());
        return "/item";
    }

    @GetMapping("/addComments/")
    public String addComments(Model model, @RequestParam("itemId") int itemId, @AuthenticationPrincipal OAuth2User oauthUser){
        if(oauthUser != null){
            log.info(oauthUser.getAttributes().toString());
            model.addAttribute("member",oauthUser.getAttributes().get("email"));
        }else{
            log.info(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
            model.addAttribute("member",(String) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        }
        log.info(String.valueOf(itemId));
        model.addAttribute("itemId",itemId);

        return "/addComments";
    }

    @PostMapping("/addComments")
    public String addComments(ItemComment itemComment,MultipartFile file) throws IOException {
        ItemComment newItemComment = ItemComment.builder()
                .memberId(itemComment.getMemberId())
                .itemId(itemComment.getItemId())
                .title(itemComment.getTitle())
                .comment(itemComment.getComment())
                .star(itemComment.getStar())
                .build();
        itemService.addItemComments(newItemComment,file);
        return "redirect:/";
    }
}


