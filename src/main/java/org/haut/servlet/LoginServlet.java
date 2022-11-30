package org.haut.servlet;

import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.haut.entity.Student;
import org.haut.mapper.*;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String password = request.getParameter("password");
        Subject subject = SecurityUtils.getSubject();
        HttpSession sn = request.getSession();
        UsernamePasswordToken token = new UsernamePasswordToken(uid, password);
        SqlSession sqlSession = MyBatisUtil.openSession();
        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        int role = Integer.parseInt(roleUserMapper.selectRoleNameByUid(uid));
        String name = "";
        if(role==1) {
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            name = studentMapper.selectNameByUid(uid);
            Student student = studentMapper.selectStudentByUid(uid);
            sn.setAttribute("student",student);
        } else if(role==5) {
            TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
            name = teacherMapper.selectNameByTid(uid);
        } else if(role==3) {
            JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);
            name = judgeMapper.selectNameByJid(uid);
        } else if(role==4) {
            VolunteerMapper volunteerMapper = sqlSession.getMapper(VolunteerMapper.class);
            name = volunteerMapper.selectNameByVid(uid);
        } else {
            name = "管理员";
        }
        try {
            subject.login(token);
            Session session = subject.getSession();
            session.setAttribute("subject", subject);
            session.setAttribute("name", name);
            response.sendRedirect("main.jsp");
        } catch (AuthenticationException e) {
            request.setAttribute("error", "验证失败");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
