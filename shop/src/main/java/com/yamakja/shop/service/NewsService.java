package com.yamakja.shop.service;

import com.yamakja.shop.domain.News;
import com.yamakja.shop.mapper.NewsMapper;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class NewsService {

    private final NewsMapper newsMapper;

    public void addNews(News news, MultipartFile file) throws IOException {
        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\imgs\\news";

        UUID uuid = UUID.randomUUID();

        String fileName = uuid + "_" + file.getOriginalFilename();

        File saveFile = new File(projectPath, fileName);
        file.transferTo(saveFile);

        news.setFName(fileName);
        news.setFPath("/imgs/" + fileName);

        newsMapper.addNews(news);
    }

    public List<News> getNews() {
        return newsMapper.getNews();
    }
}
