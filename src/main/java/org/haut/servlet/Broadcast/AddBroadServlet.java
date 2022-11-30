package org.haut.servlet.Broadcast;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Broadcast;
import org.haut.mapper.BroadcastMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddBroadServlet", value = "/broadcast/add")
public class AddBroadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String bTitle = request.getParameter("bTitle");
        String bContent = request.getParameter("bContent");
        String bTime = request.getParameter("bTimeStr");
        String bSportmeetingid = request.getParameter("bSportmeetingid");

        Broadcast broadcast = new Broadcast();
        broadcast.setBTitle(bTitle);
        broadcast.setBContent(bContent);
        broadcast.setBTimeStr(bTime);
        broadcast.setBSportmeetingid(Integer.parseInt(bSportmeetingid));

        SqlSession sqlSession = MyBatisUtil.openSession();
        BroadcastMapper broadcastMapper = sqlSession.getMapper(BroadcastMapper.class);
        broadcastMapper.insert(broadcast);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
