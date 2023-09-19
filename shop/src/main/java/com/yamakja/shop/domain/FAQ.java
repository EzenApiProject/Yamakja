package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class FAQ {
    int FAQId;
    String memberId;
    String title;
    String content;
    Date createdAt;
}
