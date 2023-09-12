package com.yamakja.shop.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;

@Slf4j
@Getter
@Builder
public class OAuthAttributes {
    private Map<String, Object> attributes;
    private String nameAttributeKey;
    private String name;
    private String email;
    private String id;
    private String birthday;
    private String phone;
    public static OAuthAttributes of(String registrationId, String userNameAttributeName, Map<String,Object> attributes){
        log.info(registrationId);
        if("naver".equals(registrationId)) {
            return ofNaver("id", attributes);
        }
        return ofGoogle(userNameAttributeName, attributes);
    }
        private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String,Object> attributes){
        log.info("ofGoogle called");
    return OAuthAttributes.builder()
            .name((String) attributes.get("name"))
            .id((String) attributes.get("openid"))
            .email((String) attributes.get("email"))
            .attributes(attributes)
            .nameAttributeKey(userNameAttributeName)
            .build();
    }
    private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String,Object> attributes){
            Map<String, Object> response = (Map<String, Object>) attributes.get("response");
            return OAuthAttributes.builder()
            .id((String) response.get("id"))
            .name((String) response.get("name"))
            .email((String) response.get("email"))
            .birthday((String) response.get("birthday"))
            .phone((String) response.get("mobile"))
            .attributes(response)
            .nameAttributeKey(userNameAttributeName)
            .build();
    }
    public Member toEntity() {
            return Member.builder()
            .name(name)
            .email(email)
            .password("1234")
            .role("ROLE_USER")
            .build();
    }
}
