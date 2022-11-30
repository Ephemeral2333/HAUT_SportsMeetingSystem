package org.haut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.ClassesMapper;
import org.haut.util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Classes {
    /**
     * 班级id
     */
    private Integer cId;

    /**
     * 班级名称
     */
    private String cName;

    /**
     * 班主任id
     */
    private Integer cHeadmasterid;

    /**
     * 专业
     */
    private String cMajor;

    /**
     * 学院id
     */
    private Integer cDeptid;

    private Integer total;

    private Teacher teacher;

    private Department department;

    private List<Classes> classesList;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ClassesMapper mapper = sqlSession.getMapper(ClassesMapper.class);
        classesList = mapper.findAll();
        sqlSession.close();
    }

    public void findDetailsBycId(Integer cId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ClassesMapper mapper = sqlSession.getMapper(ClassesMapper.class);
        Classes classes = mapper.selectByPK(cId);

        this.cId = classes.cId;
        this.cName = classes.cName;
        this.cHeadmasterid = classes.cHeadmasterid;
        this.cMajor = classes.cMajor;
        this.cDeptid = classes.cDeptid;
        this.total = classes.total;
        this.teacher = classes.teacher;
        this.department = classes.department;

        sqlSession.close();
    }
}
