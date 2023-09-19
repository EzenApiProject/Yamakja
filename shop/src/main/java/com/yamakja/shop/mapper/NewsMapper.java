package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.News;
import com.yamakja.shop.domain.NewsComment;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface NewsMapper {
    public void addNews(News news);

    public List<News> getNews();

    public List<NewsComment> getComment();

    public News getNewsById(int newsId);
    public List<NewsComment> getCommentById(int newsId);
}
