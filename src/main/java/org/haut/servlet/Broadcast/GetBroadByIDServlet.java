package org.haut.servlet.Broadcast;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Broadcast;
import org.haut.entity.Sportmeeting;
import org.haut.mapper.BroadcastMapper;
import org.haut.mapper.SportmeetingMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetBroadByIDServlet", value = "/broadcast/findById")
public class GetBroadByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        BroadcastMapper mapper = sqlSession.getMapper(BroadcastMapper.class);
        Broadcast broadcast = mapper.findById(Integer.parseInt(id));
        sqlSession.close();
        retData(response, broadcast);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Broadcast broadcast) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(broadcast));
    }
}
