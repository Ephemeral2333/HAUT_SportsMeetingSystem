package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Classes;
import org.haut.entity.Role;
import org.haut.mapper.ClassesMapper;
import org.haut.mapper.RoleMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class ClassesMapperTest {
    private SqlSession session;
    private ClassesMapper classesMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        classesMapper = session.getMapper(ClassesMapper.class);
    }

    @Test
    public void selectByCid() {
        Classes classes = classesMapper.selectByPK(2);
        System.out.println(classes);
    }

    @Test
    public void findAll() {
        List<Classes> classesList = classesMapper.findAll();
        for (Classes classes : classesList) {
            System.out.println(classes);
        }
    }


    @After
    public void destory(){
        session.close();
    }
}
