package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class News {
    String newsId;
    String title;
    String content;
    Date createdAt;
    String fPath;
    String fName;
    String url;
    String preview;
}
