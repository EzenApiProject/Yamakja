package com.yamakja.shop.mapper;

import com.yamakja.shop.domain.Item;
import com.yamakja.shop.domain.ItemComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ItemMapper {
    List<Item> getItemList(); // 테이블 가져오기
    void insertItem(Item item); // 회원 가입
    Item getItemById(Integer id);
    void updateItem(Item item); // 회원 정보 수정
    void deleteItem(Long id); // 회원 탈퇴
    List<ItemComment> getItemComments(int itemId);
    void addItemComments(ItemComment itemComment);
}