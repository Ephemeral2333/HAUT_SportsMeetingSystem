package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class UserMapperTest {
    private SqlSession session;
    private UserMapper userMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        userMapper = session.getMapper(UserMapper.class);
    }

    @Test
    public void findAll(){
        System.out.println(userMapper.findUserList());
    }

    @Test
    public void getUserPassword(){
        System.out.println(userMapper.getUserPassword("admin"));
    }

    @Test
    public void updatePwd() {
        userMapper.updatePwd("stu","1234");
    }

    @Test
    public void insert(){
        userMapper.insertUser("0","1");
    }

    @Test
    public void getUser(){
        System.out.println(userMapper.selectByPK("stu"));
    }

    @Test
    public void insertUser() {
        userMapper.insert("202013040507","1",true);
    }

    @After
    public void destory(){
        session.close();
    }
}
