package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    List<Member> getMemberList(); // User 테이블 가져오기
    void insertMember(Member member); // 회원 가입
    Member getMemberById(String id);
    Member getMemberByEmail(String email);
    void updateMember(Member member); // 회원 정보 수정
    void deleteMember(Long id); // 회원 탈퇴
}