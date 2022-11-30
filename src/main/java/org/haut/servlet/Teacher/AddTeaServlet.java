package org.haut.servlet.Teacher;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Teacher;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.TeacherMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddTeaServlet", value = "/teacher/add")
public class AddTeaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tno = request.getParameter("tNo");
        String tname = request.getParameter("tName");
        String email = request.getParameter("tEmail");
        String phone = request.getParameter("tPhone");
        String genderStr = request.getParameter("tGender");
        boolean gender = true;
        if(genderStr.equals("男")) {
            gender = true;
        } else {
            gender = false;
        }
        String identity = request.getParameter("tIdentity");
        boolean status = true;
        if(request.getParameter("status").equals("1"))
            status = true;
        else
            status = false;
        String idcard = request.getParameter("tIdcard");
        String password = request.getParameter("password");

        Teacher teacher = new Teacher();
        teacher.setTNo(tno);
        teacher.setTName(tname);
        teacher.setTEmail(email);
        teacher.setTPhone(phone);
        teacher.setStatus(status);
        teacher.setTIdcard(idcard);
        teacher.setTIdentity(identity);
        teacher.setTGender(gender);

        SqlSession sqlSession = MyBatisUtil.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.insert(tno, password, status);

        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        teacherMapper.insert(teacher);

        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.insert(5, tno);

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
