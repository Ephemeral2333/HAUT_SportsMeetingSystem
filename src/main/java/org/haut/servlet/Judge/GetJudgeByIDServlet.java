package org.haut.servlet.Judge;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Judge;
import org.haut.entity.Teacher;
import org.haut.mapper.JudgeMapper;
import org.haut.mapper.TeacherMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetJudgeByIDServlet", value = "/judge/findById")
public class GetJudgeByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);
        Judge judge = judgeMapper.selectByPK(Integer.parseInt(id));
        sqlSession.close();
        retData(response, judge);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Judge judge) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(judge));
    }
}
