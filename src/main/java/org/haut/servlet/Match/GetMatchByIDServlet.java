package org.haut.servlet.Match;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Department;
import org.haut.entity.Matches;
import org.haut.mapper.DepartmentMapper;
import org.haut.mapper.MatchesMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetMatchByIDServlet", value = "/matches/findById")
public class GetMatchByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        Matches matches = matchesMapper.findById(Integer.parseInt(id));
        sqlSession.close();
        retData(response, matches);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Matches matches) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(matches));
    }
}
