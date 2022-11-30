package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Judge;
import org.haut.mapper.JudgeMapper;
import org.haut.mapper.RoleMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class JudgeMapperTest {
    private SqlSession session;
    private JudgeMapper judgeMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        judgeMapper = session.getMapper(JudgeMapper.class);
    }

    @Test
    public void insert() {
        judgeMapper.insertJudge("stu","2","3");
    }

    @Test
    public void selectByJID() {
        Judge judge = new Judge();
        judge.selectByJID(1);
        System.out.println(judge);
    }

    @After
    public void destory(){
        session.close();
    }
}
