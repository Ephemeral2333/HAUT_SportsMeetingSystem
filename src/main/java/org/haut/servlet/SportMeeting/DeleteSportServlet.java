package org.haut.servlet.SportMeeting;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.SportmeetingMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteSportServlet", value = "/sportmeeting/deleteByPK")
public class DeleteSportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sid = request.getParameter("sId");
        SqlSession sqlSession = MyBatisUtil.openSession();
        SportmeetingMapper sportmeetingMapper = sqlSession.getMapper(SportmeetingMapper.class);
        sportmeetingMapper.deleteByPK(Integer.valueOf(sid));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
