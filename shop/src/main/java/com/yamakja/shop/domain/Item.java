package com.yamakja.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Item {
    Integer itemId;
    String name;
    int price;
    String description;
    int stock;
    String category;
    String fName; // 이미지 파일 업로드
    String fPath;
}
