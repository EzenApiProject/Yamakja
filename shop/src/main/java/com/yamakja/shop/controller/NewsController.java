package com.yamakja.shop.controller;


import com.yamakja.shop.domain.News;
import com.yamakja.shop.service.NewsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.io.IOException;

@Controller
@Slf4j
@RequiredArgsConstructor
public class NewsController {

    private final NewsService newsService;

    @GetMapping ("/news")
    public String getNews(Model model){
        List<News> news = newsService.getNews();
        model.addAttribute("news",news);
        return"/news";
    }

    @PostMapping("/addNews")
    public String addNews(News news, MultipartFile file) throws IOException {
        news.setPreview(news.getContent().substring(0,49));
        newsService.addNews(news,file);
        return "/news";
    }
}
