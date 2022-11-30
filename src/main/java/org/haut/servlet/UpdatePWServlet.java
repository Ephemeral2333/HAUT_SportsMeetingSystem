package org.haut.servlet;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdatePWServlet", value = "/updatePW")
public class UpdatePWServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uid = request.getParameter("uid");
        System.out.println(uid);
        String oldPW = request.getParameter("oldPassword");
        System.out.println(oldPW);
        String newPW = request.getParameter("newPassword");
        System.out.println(newPW);
        SqlSession sqlSession = MyBatisUtil.openSession();
        PrintWriter out = response.getWriter();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        if(userMapper.getUserPassword(uid).equals(oldPW)) {
            userMapper.updatePwd(uid, newPW);
            out.print(1);
        } else {
            out.print(-1);
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
