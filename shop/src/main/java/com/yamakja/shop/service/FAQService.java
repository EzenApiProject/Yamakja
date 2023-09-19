package com.yamakja.shop.service;

import com.yamakja.shop.domain.FAQ;
import com.yamakja.shop.mapper.FAQMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FAQService {
    private final FAQMapper faqMapper;

    public List<FAQ> getFAQ(){
        return faqMapper.getFAQ();
    }

    public FAQ getFAQById(String memberId){
        return faqMapper.getFAQById(memberId);
    }

    public void addFAQ(FAQ faq){
        faqMapper.addFAQ(faq);
    }
}
