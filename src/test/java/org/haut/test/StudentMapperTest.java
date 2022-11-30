package org.haut.test;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Student;
import org.haut.mapper.StudentMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class StudentMapperTest {
    private SqlSession session;
    private StudentMapper userMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        userMapper = session.getMapper(StudentMapper.class);
    }

    @Test
    public void insert(){
        userMapper.insertStudent("stu","stu","1612702983@qq.com");
    }

    @Test
    public void selectStudentByUid(){
        Student stu = Student.createStudent("stu");
        System.out.println(stu.getSEmail());
        System.out.println(stu);
    }

    @Test
    public void selectByPK(){
        Student stu = userMapper.selectByPK(1);
        System.out.println(stu);
    }

    @Test
    public void update() {
        Student stu = userMapper.selectByPK(1);
        stu.setSIdcard("123456789");
        userMapper.update(stu);
    }

    @Test
    public void insertStu() {
        Student stu = new Student();
        stu.setSNo("202013040507");
        stu.setSName("haut");
        stu.setSEmail("123@qq.com");
        stu.setSPhone("123456789");
        stu.setSIdcard("123456789");
        stu.setSGenderStr("女");
        stu.setSGender(true);
        stu.setStatus(true);
        stu.setSClassid(1);
        userMapper.insert(stu);
    }

    @After
    public void destory(){
        session.close();
    }
}
