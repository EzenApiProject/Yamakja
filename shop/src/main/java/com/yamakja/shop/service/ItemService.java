package com.yamakja.shop.service;

import com.yamakja.shop.domain.Item;
import com.yamakja.shop.mapper.ItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
public class ItemService {

    @Autowired
    private ItemMapper itemMapper;

    public void insertItem(Item item, MultipartFile file) throws IOException {
        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\imgs";

        UUID uuid = UUID.randomUUID();

        String fileName = uuid + "_" + file.getOriginalFilename();

        File saveFile = new File(projectPath, fileName);
        file.transferTo(saveFile);

        item.setItemId(0); // null포인터때매 임시값
        item.setFName(fileName);
        item.setFPath("/imgs/" + fileName);
        log.info(item.toString());
        itemMapper.insertItem(item);
    }

    public List<Item> getItems(){
        return itemMapper.getItemList();
    }

    public Item getItemById(Integer id){
        log.info("id " + id + "번의 정보 따오기");
        return itemMapper.getItemById(id);
    }

}
