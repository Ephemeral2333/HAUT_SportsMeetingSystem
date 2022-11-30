package org.haut.servlet.Event;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Event;
import org.haut.entity.Sportmeeting;
import org.haut.mapper.EventMapper;
import org.haut.mapper.SportmeetingMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetEventByIDServlet", value = "/event/findById")
public class GetEventByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        EventMapper mapper = sqlSession.getMapper(EventMapper.class);
        Event event = mapper.selectByPK(Integer.parseInt(id));
        sqlSession.close();
        retData(response, event);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Event event) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(event));
    }
}
