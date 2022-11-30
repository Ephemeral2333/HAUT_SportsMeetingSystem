package org.haut.mapper;

import org.haut.entity.Message;

import java.util.List;

public interface MessageMapper {
    List<Message> selectByVNo(String vNo);
    void update(String mid);
    void updateMessage(Message message);
    void insertMessage(Message message);
    Message selectByPK(Integer mid);
    void deleteByPK(Integer mid);
}
