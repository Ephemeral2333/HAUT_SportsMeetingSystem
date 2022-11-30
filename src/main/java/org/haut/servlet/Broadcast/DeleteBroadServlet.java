package org.haut.servlet.Broadcast;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BroadcastMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteBroadServlet", value = "/broadcast/deleteById")
public class DeleteBroadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");

        SqlSession sqlSession = MyBatisUtil.openSession();
        BroadcastMapper broadcastMapper = sqlSession.getMapper(BroadcastMapper.class);
        broadcastMapper.deleteById(Integer.parseInt(id));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
