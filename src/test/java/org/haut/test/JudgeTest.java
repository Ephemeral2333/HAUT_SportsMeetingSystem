package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Borrow;
import org.haut.entity.Judge;
import org.haut.mapper.BorrowMapper;
import org.haut.mapper.JudgeMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class JudgeTest {
    private SqlSession session;
    //mapper接口
    private JudgeMapper judgeMapper;

    @Before
    public void init(){
        //利用MyBatisUtil工具类获取数据库的连接
        session = MyBatisUtil.openSession();
        //获取到UserMapper的接口
        judgeMapper = session.getMapper(JudgeMapper.class);
    }

    @Test
    public void findAll(){
        Judge judgeList = judgeMapper.selectByPK(1);
        System.out.println(judgeList);
    }

    @After
    public void destory(){
        //关闭连接
        session.close();
    }
}
