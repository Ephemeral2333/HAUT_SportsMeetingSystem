package org.haut.servlet.Event;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Event;
import org.haut.mapper.EventMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteEventServlet", value = "/event/deleteById")
public class DeleteEventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        EventMapper mapper = sqlSession.getMapper(EventMapper.class);
        mapper.deleteById(Integer.parseInt(id));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
