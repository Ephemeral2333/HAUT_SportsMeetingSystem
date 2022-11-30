package org.haut.mapper;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.haut.entity.Role;
import org.haut.entity.User;

import java.util.List;

@Mapper
public interface UserMapper {
    List<User> findUserList();
    String getUserPassword(String uid);
    void insertUser(String uid, String pwd);
    void updatePwd(String uid, String pwd);
    User selectByPK(String uid);
    User selectByPKToS(String uid);
    void deleteByPK(String uid);
    void insert(String uid, String pwd, boolean status);
}