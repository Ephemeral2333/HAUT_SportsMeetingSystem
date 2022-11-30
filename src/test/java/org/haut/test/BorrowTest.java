package org.haut.test;

import org.haut.entity.Borrow;
import org.haut.mapper.BorrowMapper;
import org.haut.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class BorrowTest {
    //数据库连接
    private SqlSession session;
    //mapper接口
    private BorrowMapper userMapper;

    @Before
    public void init(){
        //利用MyBatisUtil工具类获取数据库的连接
        session = MyBatisUtil.openSession();
        //获取到UserMapper的接口
        userMapper = session.getMapper(BorrowMapper.class);
    }

    @Test
    public void findAll(){
        List<Borrow> borrowList = userMapper.findAll();
        System.out.println(borrowList);
    }

    @After
    public void destory(){
        //关闭连接
        session.close();
    }
}


