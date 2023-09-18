package com.yamakja.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderList {
    Integer orderId;
    String status;
    String memberId;
    Date createdAt;
    Integer itemID;
    int quantity;
}
