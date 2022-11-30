package org.haut.servlet.SportMeeting;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Department;
import org.haut.entity.Sportmeeting;
import org.haut.mapper.SportmeetingMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetSportByIDServlet", value = "/sportmeeting/findBysId")
public class GetSportByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        SportmeetingMapper mapper = sqlSession.getMapper(SportmeetingMapper.class);
        Sportmeeting sportmeeting = mapper.selectByPK(Integer.parseInt(id));
        sqlSession.close();
        retData(response, sportmeeting);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Sportmeeting sportmeeting) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(sportmeeting));
    }
}
