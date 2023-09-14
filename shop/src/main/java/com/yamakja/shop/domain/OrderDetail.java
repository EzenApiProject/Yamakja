package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderDetail {
    Integer orderId; // Order의 OrderId의 fk
    Integer itemID;
    int quantity;
}
