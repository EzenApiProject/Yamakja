package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
public class Item {
    String name;
    int price;
    String description;
    int stock;
    String category;
    MultipartFile image; // 이미지 파일 업로드
}
