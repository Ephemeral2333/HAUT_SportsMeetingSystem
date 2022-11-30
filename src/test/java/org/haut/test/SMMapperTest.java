package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Sportmeeting;
import org.haut.entity.Student;
import org.haut.mapper.SportmeetingMapper;
import org.haut.mapper.StudentMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class SMMapperTest {
    private SqlSession session;
    private SportmeetingMapper smMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        smMapper = session.getMapper(SportmeetingMapper.class);
    }


    @Test
    public void selectByID(){
//        Sportmeeting sm = Sportmeeting.selectSportmeetingById(2022);
//        System.out.println(sm);
    }

    @After
    public void destory(){
        session.close();
    }
}
