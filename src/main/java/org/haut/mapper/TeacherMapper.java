package org.haut.mapper;

import org.haut.entity.Teacher;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface TeacherMapper {
    void insertTeacher(String tid, String tname, String email);
    String selectEmailByTid(String tid);
    String selectNameByTid(String tid);
    Teacher selectByPK(Integer id);
    List<Teacher> findAll();
    void update(Teacher teacher);
    void insert(Teacher teacher);
    void deleteByPK(String tno);
}