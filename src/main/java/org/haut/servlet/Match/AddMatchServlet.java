package org.haut.servlet.Match;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Matches;
import org.haut.mapper.MatchesMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddMatchServlet", value = "/match/add")
public class AddMatchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mno = request.getParameter("mNo");
        String meid = request.getParameter("mEid");
        String msort = request.getParameter("mSort");

        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        Matches matches = new Matches();

        matches.setMNo(mno);
        matches.setMEid(Integer.parseInt(meid));
        matches.setMSort(msort);
        matchesMapper.insert(matches);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
