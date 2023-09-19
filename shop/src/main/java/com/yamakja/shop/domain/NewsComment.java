package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class NewsComment {
    int newsCommentId;
    int newsId;
    String memberId;
    String comment;
    Date createdAt;
}
