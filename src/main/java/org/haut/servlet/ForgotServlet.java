package org.haut.servlet;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.*;
import org.haut.util.Email.EmailUtil;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ForgotServlet", value = "/forgot")
public class ForgotServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        SqlSession sqlSession = MyBatisUtil.openSession();
        String uid = request.getParameter("uid");
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        if(type.equals("email")) {
            RoleUserMapper rumapper = sqlSession.getMapper(RoleUserMapper.class);
            int role = Integer.parseInt(rumapper.selectRoleNameByUid(uid));
            String email = null;
            if(role == 1) {
                StudentMapper smapper = sqlSession.getMapper(StudentMapper.class);
                email = smapper.selectEmailByUid(uid);
            } else if(role == 5) {
                TeacherMapper tmapper = sqlSession.getMapper(TeacherMapper.class);
                email = tmapper.selectEmailByTid(uid);
            } else if(role == 3) {
                JudgeMapper jmapper = sqlSession.getMapper(JudgeMapper.class);
                email = jmapper.selectEmailByJid(uid);
            } else if(role == 4) {
                VolunteerMapper vmapper = sqlSession.getMapper(VolunteerMapper.class);
                email = vmapper.selectEmailByVid(uid);
            }
            System.out.println(email);
            if(email == null) {
                out.print(-1);
            } else {
                EmailUtil emailUtil = EmailUtil.instance;
                try {
                    emailUtil.sendEmail(email);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                String vCode = emailUtil.getVCode();
                session.setAttribute("vCode", vCode);
                out.print(1);
            }
            out.flush();
            out.close();
        } else if(type.equals("submit")) {
            String code = request.getParameter("code");
            String vCode = (String) session.getAttribute("vCode");
            String pwd = request.getParameter("pwd");

            if(code.equals(vCode)) {
                UserMapper umapper = sqlSession.getMapper(UserMapper.class);
                umapper.updatePwd(uid, pwd);
                out.print(1);
            } else {
                out.print(-1);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
