package org.haut.servlet.Message;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Broadcast;
import org.haut.entity.Message;
import org.haut.mapper.BroadcastMapper;
import org.haut.mapper.MessageMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetMesByIDServlet", value = "/message/findById")
public class GetMesByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
        Message message = mapper.selectByPK(Integer.valueOf(id));
        sqlSession.close();
        retData(response, message);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Message message) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(message));
    }
}
