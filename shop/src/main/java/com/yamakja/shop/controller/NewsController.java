package com.yamakja.shop.controller;


import com.yamakja.shop.domain.News;
import com.yamakja.shop.domain.NewsComment;
import com.yamakja.shop.service.NewsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        List<NewsComment> comment = newsService.getComment();
        log.info(news.toString());
        model.addAttribute("news",news);
        model.addAttribute("comment",comment);
        return"/news";
    }

    @GetMapping("/addNews")
    public String add(){
        return "/addNews";
    }

    @GetMapping("/news/")
    public String newsDetail(Model model,@RequestParam("newsId") int newsId){
        model.addAttribute("news",newsService.getNewsById(newsId));
        model.addAttribute("comment",newsService.getCommentById(newsId));
        return "/newsDetail";
    }

    @PostMapping("/addNews")
    public String addNews(News news, MultipartFile file,Model model) throws IOException {
        int num = 0;
        if(news.getContent().length() > 49){
            num = 49;
        }else{
            num = news.getContent().length();
        }
        news.setPreview(news.getContent().substring(0,num));
        newsService.addNews(news,file);
        List<News> newNews = newsService.getNews();
        model.addAttribute("news",newNews);
        return "/news";
    }
}
