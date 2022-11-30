package org.haut.servlet.Event;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Event;
import org.haut.mapper.EventMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateEventServlet", value = "/event/update")
public class UpdateEventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String eid = request.getParameter("eId");
        String ename = request.getParameter("eName");
        String eplace = request.getParameter("ePlace");
        String smid = request.getParameter("eSportmeetingid");

        boolean gender = true;
        String genderStr = request.getParameter("eGender");
        if (genderStr.equals("女")) {
            gender = false;
        }

        String date = request.getParameter("eDate");
        String starttime = request.getParameter("eStarttime");
        String endtime = request.getParameter("eEndtime");
        String judge = request.getParameter("eJudgementid");
        String eunit = request.getParameter("eUnit");
        String rule = request.getParameter("eRules");

        SqlSession sqlSession = MyBatisUtil.openSession();
        EventMapper mapper = sqlSession.getMapper(EventMapper.class);
        Event event = mapper.selectByPK(Integer.parseInt(eid));
        event.setEName(ename);
        event.setEPlace(eplace);
        event.setESportmeetingid(Integer.parseInt(smid));
        event.setEGender(gender);
        event.setEDateStr(date);
        event.setEStarttimeStr(starttime);
        event.setEEndtimeStr(endtime);
        event.setEJudgementid(judge);
        event.setEUnit(eunit);
        event.setERules(rule);
        mapper.update(event);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
