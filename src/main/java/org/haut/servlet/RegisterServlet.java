package org.haut.servlet;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.User;
import org.haut.mapper.*;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        SqlSession sqlSession = MyBatisUtil.openSession();
        PrintWriter out = response.getWriter();

        String uid = request.getParameter("uid");
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");
        String email = request.getParameter("email");
        String vcode = request.getParameter("vcode");
        String vCode = session.getAttribute("vCode").toString();
        int type = Integer.parseInt(request.getParameter("type"));

        if (vcode.equals(vCode)) {
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userMapper.insertUser(uid, pwd);
            RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
            roleUserMapper.insert(type, uid);
            if (type == 1) {
                StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
                studentMapper.insertStudent(uid, uname, email);
                sqlSession.commit();
            } else if (type == 5) {
                TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
                teacherMapper.insertTeacher(uid, uname, email);
            } else if (type == 3) {
                JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);
                judgeMapper.insertJudge(uid, uname, email);
            } else if (type == 4) {
                VolunteerMapper volunteerMapper = sqlSession.getMapper(VolunteerMapper.class);
                volunteerMapper.insertVolunteer(uid, uname, email);
            }
            out.print(1);
            sqlSession.close();
            out.flush();
            out.close();
        } else {
            out.print(-1);
            sqlSession.close();
            out.flush();
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
