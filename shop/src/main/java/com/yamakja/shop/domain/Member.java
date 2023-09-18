package com.yamakja.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private String id;
    private String password;
    private String address;
    private String name;
    private String email;
    private String phone;
    private String role;
    private String birthday;
}
