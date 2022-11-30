package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Role;
import org.haut.mapper.RoleMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class RoleTest {
    private SqlSession session;
    private RoleMapper roleMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        roleMapper = session.getMapper(RoleMapper.class);
    }

    @Test
    public void listRoles(){
        System.out.println(roleMapper.listRoles("admin"));
    }

    @Test
    public void insert() {

    }

    @Test
    public void findAll() {
        List<Role> roleList = roleMapper.findAll();
        for (Role role : roleList) {
            System.out.println(role);
        }
    }

    @After
    public void destory(){
        session.close();
    }
}
