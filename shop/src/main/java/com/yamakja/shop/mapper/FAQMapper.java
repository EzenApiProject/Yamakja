package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.FAQ;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface FAQMapper {
    List<FAQ> getFAQ();

    FAQ getFAQById(String memberId);

    void addFAQ(FAQ faq);

}
