package org.haut.servlet.Match;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Matches;
import org.haut.mapper.MatchesMapper;
import org.haut.util.MyBatisUtil;
import org.springframework.security.core.parameters.P;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GradeInputServlet", value = "/match/input")
public class GradeInputServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mid = request.getParameter("mId");
        String score = request.getParameter("mScore");
        String rank = request.getParameter("mRank");

        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        Matches matches = matchesMapper.selectByPK(Integer.parseInt(mid));
        matches.setMScore(score);
        matches.setMRank(Integer.valueOf(rank));
        matchesMapper.updateScore(matches);

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
