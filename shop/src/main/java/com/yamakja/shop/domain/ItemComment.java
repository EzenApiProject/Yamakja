package com.yamakja.shop.domain;

import lombok.*;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ItemComment {
    int itemCommentId;
    String memberId;
    int itemId;
    String title;
    String comment;
    String fPath;
    String fName;
    Date createdAt;
}
