package com.yamakja.shop.controller;

import com.yamakja.shop.domain.Member;
import com.yamakja.shop.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.memory.UserAttribute;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;
import java.util.jar.Attributes;

@Slf4j
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;


//    @GetMapping("/myPage")
    public String myPage(){
        return "/myPage";
    }

    //@GetMapping("/") 사용자 데이터를 소셜로그인인지 form로그인인지 분류하여 model로 member를 전달하는 함수
    // 추후에 마이페이지에서 응용하면 될듯
    public String bringMember(@AuthenticationPrincipal OAuth2User oauthUser, Model model) { // 인증된 사용자의 정보를 보여줌
        if(oauthUser != null){
            log.info(oauthUser.getAttributes().toString());
            model.addAttribute("member",oauthUser.getAttributes());
        }else{
            log.info(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
            model.addAttribute("member",memberService.getUserById((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()));
        }
        return "home";
    }

    @GetMapping("/userList")
    public String getUserList(Model model) { // User 테이블의 전체 정보를 보여줌
        List<Member> userList = memberService.getUserList();
        model.addAttribute("list", userList);
        return "userListPage";
    }

//    @GetMapping("/login") // 익명유저 활성화 전용
    public String loginPage() { // 로그인되지 않은 상태이면 로그인 페이지를, 로그인된 상태이면 home 페이지를 보여줌
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "loginPage";
        return "redirect:/";
    }
    @GetMapping("/login")
    public String directLoginPage() { // 로그인되지 않은 상태이면 로그인 페이지를, 로그인된 상태이면 home 페이지를 보여줌
            return "/loginPage";
    }

    @GetMapping("/signup")
    public String signupPage() {  // 회원 가입 페이지
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "signupPage";
        return "redirect:/";
    }

    @PostMapping("/signup")
    public String signup(Member member) { // 회원 가입
        try {
            memberService.signup(member);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/login";
    }


    @GetMapping("/update")
    public String editPage(Model model) { // 회원 정보 수정 페이지
        String id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Member member = memberService.getUserById(id);
        model.addAttribute("user", member);
        return "editPage";
    }

    @PostMapping("/update")
    public String edit(Member member) { // 회원 정보 수정
        String id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        member.setId(id);
        memberService.edit(member);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String withdraw(HttpSession session) { // 회원 탈퇴
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (id != null) {
            memberService.withdraw(id);
        }
        SecurityContextHolder.clearContext(); // SecurityContextHolder에 남아있는 token 삭제
        return "redirect:/";
    }
}
