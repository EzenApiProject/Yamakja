package com.yamakja.shop.service;

import com.yamakja.shop.domain.Member;
import com.yamakja.shop.mapper.MemberMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;

    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public List<Member> getUserList() {
        return memberMapper.getMemberList();
    }

    public Member getUserById(String id) {
        return memberMapper.getMemberById(id);
    }


    public void signup(Member member) { // 회원 가입
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        member.setRole("ROLE_USER");
        memberMapper.insertMember(member);
    }

    public void edit(Member member) { // 회원 정보 수정
        // password는 암호화해서 DB에 저장
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        memberMapper.updateMember(member);
    }

    public void withdraw(Long id) { // 회원 탈퇴
        memberMapper.deleteMember(id);
    }

    public PasswordEncoder passwordEncoder() {
        return this.passwordEncoder;
    }

    public String getMemberId(@AuthenticationPrincipal OAuth2User oauthUser) {
        String name ="";
        if (oauthUser != null) {
            name = oauthUser.getAttributes().get("email").toString();
        } else {
            name = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        }
        log.info(name);
        return name;
    }
}
