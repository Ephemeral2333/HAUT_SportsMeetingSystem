package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Student;
import org.haut.mapper.MatchesMapper;
import org.haut.mapper.StudentMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class MatchesMapperTest {
    private SqlSession session;
    private MatchesMapper matchesMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        matchesMapper = session.getMapper(MatchesMapper.class);
    }


    @Test
    public void selectMatch(){
//        matchesMapper.selectBymNo("stu");
        System.out.println(matchesMapper.selectBymNo("stu"));
    }

    @Test
    public void selectMyParticipate(){
        System.out.println(matchesMapper.selectMyParticipate("stu"));
    }

    @After
    public void destory(){
        session.close();
    }
}
