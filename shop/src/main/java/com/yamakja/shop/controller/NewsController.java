package com.yamakja.shop.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class NewsController {

    @GetMapping("/news")
    public String news(Model model){
        return"/news";
    }

}
