package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderItem {
        Integer orderId; // Order의 OrderId의 fk
        int quantity;
        Integer itemId;
        String name;
        int price;
        String description;
        int stock;
        String category;
        String fName; // 이미지 파일 업로드
        String fPath;
}
