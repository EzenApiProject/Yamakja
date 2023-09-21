package com.yamakja.shop.service;

import com.yamakja.shop.domain.Member;
import com.yamakja.shop.domain.OAuthAttributes;
import com.yamakja.shop.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Collections;

@Slf4j
@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    private final MemberMapper memberMapper;
    private final HttpSession httpSession;


    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService<OAuth2UserRequest,OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails()
                .getUserInfoEndpoint().getUserNameAttributeName();

        OAuthAttributes attributes = OAuthAttributes.of(registrationId,userNameAttributeName,oAuth2User.getAttributes());
        Member member = saveOrUpdate(attributes,registrationId);
        httpSession.setAttribute("member",member);

        return new DefaultOAuth2User(
                Collections.singleton(new SimpleGrantedAuthority(member.getRole())),
                attributes.getAttributes(),
                attributes.getNameAttributeKey()
        );
    }
    private Member saveOrUpdate(OAuthAttributes attributes,String registrationId) {
        if (memberMapper.getMemberByEmail(attributes.getEmail()) == null) {
            log.info("not exist");
            if ("naver".equals(registrationId)){
                return saveNaver(attributes);
            }
            return saveGoogle(attributes);
        } else {
            log.info("exist");
            return memberMapper.getMemberByEmail(attributes.getEmail());
        }
    }

    private Member saveNaver(OAuthAttributes attributes) {
        Member member = Member.builder()
                .id(attributes.getEmail())
                .password("NaverLogin")
                .address("")
                .phone(attributes.getPhone())
                .birthday(attributes.getBirthday())
                .name(attributes.getName())
                .email(attributes.getEmail())
                .role("ROLE_USER")
                .build();
        log.info(member.toString());
        memberMapper.insertMember(member);
        return member;
    }

    private Member saveGoogle(OAuthAttributes attributes) {
        Member member = Member.builder()
                .id(attributes.getEmail())
                .password("GoogleLogin")
                .address("")
                .phone("")
                .birthday("")
                .name(attributes.getName())
                .email(attributes.getEmail())
                .role("ROLE_USER")
                .build();
        log.info(member.toString());
        memberMapper.insertMember(member);
        return member;
    }
}
