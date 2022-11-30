package org.haut.mapper;

import org.haut.entity.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Set;

@Mapper
public interface RoleMapper {
    Set<String> listRoles(String uid);
    List<Role> findAll();
}