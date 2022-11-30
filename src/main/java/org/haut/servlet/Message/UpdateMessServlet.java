package org.haut.servlet.Message;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Message;
import org.haut.mapper.MessageMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateMessServlet", value = "/message/update")
public class UpdateMessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mid = request.getParameter("mId");
        String mSno = request.getParameter("mSno");
        String mTitle = request.getParameter("mTitle");
        String mContent = request.getParameter("mContent");
        String mSender = request.getParameter("mSender");

        SqlSession sqlSession = MyBatisUtil.openSession();
        MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
        Message message = mapper.selectByPK(Integer.valueOf(mid));
        message.setMSno(mSno);
        message.setMTitle(mTitle);
        message.setMContent(mContent);
        mapper.updateMessage(message);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
