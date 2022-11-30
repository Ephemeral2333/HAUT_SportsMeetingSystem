package org.haut.servlet.Teacher;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Teacher;
import org.haut.mapper.TeacherMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateTeaServlet", value = "/teacher/update")
public class UpdateTeaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SqlSession sqlSession = MyBatisUtil.openSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);

        String tid = request.getParameter("tId");
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

        Teacher teacher = teacherMapper.selectByPK(Integer.valueOf(tid));
        teacher.setTNo(tno);
        teacher.setTName(tname);
        teacher.setTEmail(email);
        teacher.setTPhone(phone);
        teacher.setStatus(status);
        teacher.setTIdcard(idcard);
        teacher.setTIdentity(identity);
        teacher.setTGender(gender);
        teacherMapper.update(teacher);

        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.updatePwd(teacher.getTNo(), password);

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
