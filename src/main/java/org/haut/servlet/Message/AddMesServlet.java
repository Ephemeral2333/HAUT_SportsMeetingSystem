package org.haut.servlet.Message;

import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.subject.Subject;
import org.haut.entity.Message;
import org.haut.mapper.MessageMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddMesServlet", value = "/message/add")
public class AddMesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mSno = request.getParameter("mSno");
        String mTitle = request.getParameter("mTitle");
        String mContent = request.getParameter("mContent");
        HttpSession session = request.getSession();
        Subject subject = (Subject) session.getAttribute("subject");
        String mSender = subject.getPrincipal().toString();

        Message message = new Message();
        message.setMSno(mSno);
        message.setMTitle(mTitle);
        message.setMContent(mContent);
        message.setMSender(mSender);

        SqlSession sqlSession = MyBatisUtil.openSession();
        MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
        mapper.insertMessage(message);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
