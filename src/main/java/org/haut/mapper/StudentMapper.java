package org.haut.mapper;

import org.haut.entity.Student;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface StudentMapper {
    void insertStudent(String uid, String uname, String email);
    String selectEmailByUid(String uid);
    String selectNameByUid(String uid);
    Student selectStudentByUid(String uid);
    List<Student> findAll();
    Student selectByPK(Integer id);
    void update(Student student);
    void deleteByPK(String no);
    void insert(Student student);
    List<Student> selectByCid(Integer cid);
}