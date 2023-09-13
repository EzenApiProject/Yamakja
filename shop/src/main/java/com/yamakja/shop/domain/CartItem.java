package com.yamakja.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartItem {
    int cartItemId; // foreignkey reference item.itemId
    String cartMemberId; // foreignkey reference member.id
    int quantity;
}
