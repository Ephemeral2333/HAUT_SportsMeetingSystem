package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Event;
import org.haut.mapper.EventMapper;
import org.haut.mapper.MatchesMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class EventMapperTest {
    private SqlSession session;
    private EventMapper eventMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        eventMapper = session.getMapper(EventMapper.class);
    }


    @Test
    public void selectMatch(){
//        matchesMapper.selectBymNo("stu");
        System.out.println(eventMapper.findAll());
    }

    @Test
    public void allEvent(){
        Event e = new Event();
        e.findAll();
        System.out.println(e.getEventList());
        for(Event event : e.getEventList()){
            System.out.println(event.getEName());
        }
    }

    @Test
    public void insert() {
        eventMapper.participate(1,"stu");
    }

    @Test
    public void selectNoScore() {
        System.out.println(eventMapper.selectNoScore("J1003"));
    }

    @After
    public void destory(){
        session.close();
    }
}
