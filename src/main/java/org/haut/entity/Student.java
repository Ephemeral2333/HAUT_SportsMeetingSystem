package org.haut.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.StudentMapper;
import org.haut.util.MyBatisUtil;

import java.util.List;

@Data
public class Student {
    private Integer sId;
    private String sNo;
    private String sName;
    private Boolean sGender;
    private String sGenderStr;
    private Integer sClassid;
    private String sPhone;
    private String sEmail;
    private String sIdcard;
    private String oSNo;
    private String Password;
    private List<Integer> RoleList;
    private Boolean Status;
    private Classes classes;
    private List<Student> studentList;

    private User user;

    public Student(Integer id,String sNo, String sName, Boolean sGender, Integer sClassid, String sPhone, String sEmail, String sIdcard, boolean status) {
        this.sNo = sNo;
        this.sId = id;
        this.sName = sName;
        this.sGender = sGender;
        this.sClassid = sClassid;
        this.sPhone = sPhone;
        this.sEmail = sEmail;
        this.sIdcard = sIdcard;
        this.Status = status;
    }

    public Student() {

    }

    public Student(String id, String no, String name, String email, String phone, String gender, String idcard, String status, String classid) {
    }

    public String getSGenderStr() {
        if (sGender == false)
            sGenderStr = "女";
        else if (sGender == true)
            sGenderStr = "男";
        return sGenderStr;
    }

    public void setSGender(Boolean sGender) {
        if (sGenderStr.equals("男"))
            sGender = true;
        else if (sGenderStr.equals("女"))
            sGender = false;
        this.sGender = sGender;
    }

    public static Student createStudent(String uid) {
        Student student = null;
        SqlSession session = MyBatisUtil.openSession();
        StudentMapper studentMapper = session.getMapper(StudentMapper.class);
        student = studentMapper.selectStudentByUid(uid);
        session.close();
        return student;
    }

    public void findAll() {
        SqlSession session = MyBatisUtil.openSession();
        StudentMapper studentMapper = session.getMapper(StudentMapper.class);
        studentList = studentMapper.findAll();
        session.close();
    }

    public void selectBySId(Integer sId) {
        SqlSession session = MyBatisUtil.openSession();
        StudentMapper studentMapper = session.getMapper(StudentMapper.class);
        Student student = studentMapper.selectByPK(sId);
        this.sId = student.sId;
        this.sNo = student.sNo;
        this.sName = student.sName;
        this.sGender = student.sGender;
        this.sClassid = student.sClassid;
        this.sPhone = student.sPhone;
        this.sEmail = student.sEmail;
        this.sIdcard = student.sIdcard;
        this.oSNo = student.oSNo;
        this.Password = student.Password;
        this.RoleList = student.RoleList;
        this.Status = student.Status;
        this.classes = student.classes;
        this.user = student.user;
        session.close();
    }

    public void selectByCid(Integer cid) {
        SqlSession session = MyBatisUtil.openSession();
        StudentMapper studentMapper = session.getMapper(StudentMapper.class);
        studentList = studentMapper.selectByCid(cid);
        session.close();
    }
}
