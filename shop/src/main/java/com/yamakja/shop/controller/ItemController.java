package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Item;
import com.yamakja.shop.mapper.ItemMapper;
import com.yamakja.shop.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@Slf4j
public class ItemController {
    @Autowired
    private ItemService itemService;

    @GetMapping("/addItem")
    public String goInsert(){
        return"/home";
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

    @GetMapping("/item/")
    public String item(Model model, @RequestParam("itemId") int itemId){
        model.addAttribute("item",itemService.getItemById(itemId));
        return "/item";
    }
}


