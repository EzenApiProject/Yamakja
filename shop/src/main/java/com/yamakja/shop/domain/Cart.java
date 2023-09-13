package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;


// 실제로 DB에 저장되있지는 않은 item과 cartitem.quantity를 합친걸 받기위한 객체
@Data
@Builder
public class Cart {
    Integer itemId;
    String name;
    int price;
    String description;
    int stock;
    String category;
    String fName; // 이미지 파일 업로드
    String fPath;
    int quantity;
}
