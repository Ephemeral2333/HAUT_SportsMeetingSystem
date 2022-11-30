package org.haut.entity;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.MatchesMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WithDrawServlet", value = "/withdraw")
public class WithDrawServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uid = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        matchesMapper.concle(Integer.parseInt(uid));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
