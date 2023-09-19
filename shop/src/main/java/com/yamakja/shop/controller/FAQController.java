package com.yamakja.shop.controller;

import com.yamakja.shop.domain.FAQ;
import com.yamakja.shop.service.FAQService;
import com.yamakja.shop.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FAQController {
    private final FAQService faqService;
    private final MemberService memberService;

    @GetMapping("/faq")
    public String getFAQ(Model model){
        model.addAttribute("faq",faqService.getFAQ());
        return "/faq";
    }
    @GetMapping("/faq/")
    public String getFAQById(Model model, @RequestParam String memberId){
        model.addAttribute("faq",faqService.getFAQById(memberId));
        return "/faq";
    }

    @GetMapping("/addFAQ")
    public String addFormFAQ(Model model,@AuthenticationPrincipal OAuth2User oauthUser){
        String memberId = memberService.getMemberId(oauthUser);
        model.addAttribute("memberId",memberId);
        return"/addFAQ";
    }

    @PostMapping("/addFAQ")
    public String addFAQ(Model model, FAQ faq){
        FAQ newFAQ = FAQ.builder()
                        .title(faq.getTitle())
                        .content(faq.getContent())
                        .memberId(faq.getMemberId())
                        .build();
        log.info(faq.toString());
        faqService.addFAQ(faq);
        return"/faq";
    }
}
