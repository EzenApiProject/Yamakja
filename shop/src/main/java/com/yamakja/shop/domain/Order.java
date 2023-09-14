package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Data;

import java.sql.Date;

@Data
@Builder
public class Order {
    Integer orderId;
    String status;
    String memberId;
    Date createdAt;
}
