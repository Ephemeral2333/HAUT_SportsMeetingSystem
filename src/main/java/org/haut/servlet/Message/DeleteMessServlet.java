package org.haut.servlet.Message;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.MessageMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteMessServlet", value = "/message/deleteByPK")
public class DeleteMessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("mNo");
        Integer mid = Integer.parseInt(id);
        SqlSession sqlSession = MyBatisUtil.openSession();
        MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
        mapper.deleteByPK(mid);
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
