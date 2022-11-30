package org.haut.mapper;

import org.haut.entity.RoleUser;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface RoleUserMapper {
    void insert(int rid, String uid);
    String selectRoleNameByUid(String uid);
    void deleteByPK(Integer rid, String uid);
}