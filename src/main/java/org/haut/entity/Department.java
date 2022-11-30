package org.haut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.ClassesMapper;
import org.haut.mapper.DepartmentMapper;
import org.haut.util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {
    /**
     * 学院id
     */
    private Integer dId;

    /**
     * 学院名称
     */
    private String dName;

    /**
     * 院长id
     */
    private Integer dDeanid;

    private Integer total;

    private Teacher teacher;

    private List<Classes> classes;

    private List<Department> departmentList;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        departmentList = departmentMapper.findAll();
        sqlSession.close();
    }

    public void findByID(Integer id) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        Department department = departmentMapper.selectByPK(id);

        this.dName = department.dName;
        this.dDeanid = department.dDeanid;
        this.total = department.total;
        this.teacher = department.teacher;

        ClassesMapper classesMapper = sqlSession.getMapper(ClassesMapper.class);
        this.classes = classesMapper.selectByCdid(id);

        sqlSession.close();
    }
}