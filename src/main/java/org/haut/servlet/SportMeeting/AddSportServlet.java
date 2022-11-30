package org.haut.servlet.SportMeeting;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Sportmeeting;
import org.haut.mapper.SportmeetingMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddSportServlet", value = "/sport/add")
public class AddSportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sid = request.getParameter("sId");
        String sname = request.getParameter("sName");
        String sdate = request.getParameter("sDate");
        String splace = request.getParameter("sPlace");
        String starttime = request.getParameter("sStarttime");
        String endtime = request.getParameter("sEndtime");
        String desciption = request.getParameter("sDescription");
        boolean status = true;
        if (request.getParameter("sStatus").equals("0")) {
            status = false;
        }
        String theme = request.getParameter("sTheme");

        Sportmeeting sportmeeting = new Sportmeeting();
        sportmeeting.setSId(Integer.valueOf(sid));
        sportmeeting.setSName(sname);
        sportmeeting.setSDateStr(sdate);
        sportmeeting.setSPlace(splace);
        sportmeeting.setSStarttimeStr(starttime);
        sportmeeting.setSEndtimeStr(endtime);
        sportmeeting.setSDescription(desciption);
        sportmeeting.setSStatus(status);
        sportmeeting.setSTheme(theme);

        SqlSession sqlSession = MyBatisUtil.openSession();
        SportmeetingMapper sportmeetingMapper = sqlSession.getMapper(SportmeetingMapper.class);
        sportmeetingMapper.insert(sportmeeting);

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
