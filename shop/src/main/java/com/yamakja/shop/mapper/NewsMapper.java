package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.News;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface NewsMapper {
    public void addNews(News news);

    public List<News> getNews();
}
