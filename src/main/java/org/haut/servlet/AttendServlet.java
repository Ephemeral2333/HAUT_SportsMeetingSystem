package org.haut.servlet;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.EventMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AttendServlet", value = "/attend")
public class AttendServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String eid = request.getParameter("eId");
        String no = request.getParameter("No");
        System.out.println(eid);
        System.out.println(no);
        SqlSession sqlSession = MyBatisUtil.openSession();
        EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
        eventMapper.participate(Integer.parseInt(eid), no);
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
