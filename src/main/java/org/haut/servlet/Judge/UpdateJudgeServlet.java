package org.haut.servlet.Judge;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Judge;
import org.haut.entity.Teacher;
import org.haut.mapper.JudgeMapper;
import org.haut.mapper.TeacherMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateJudgeServlet", value = "/judge/update")
public class UpdateJudgeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SqlSession sqlSession = MyBatisUtil.openSession();
        JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);

        String tid = request.getParameter("jId");
        String tno = request.getParameter("jNo");
        String tname = request.getParameter("jName");
        String email = request.getParameter("jEmail");
        String phone = request.getParameter("jPhone");
        String genderStr = request.getParameter("jGender");
        boolean gender = true;
        if(genderStr.equals("男")) {
            gender = true;
        } else {
            gender = false;
        }
        String identity = request.getParameter("jIdentity");
        boolean status = true;
        if(request.getParameter("status").equals("1"))
            status = true;
        else
            status = false;
        String idcard = request.getParameter("jIdcard");
        String password = request.getParameter("password");

        Judge judge = judgeMapper.selectByPK(Integer.valueOf(tid));
        judge.setJNo(tno);
        judge.setJName(tname);
        judge.setJEmail(email);
        judge.setJIDcard(idcard);
        judge.setJPhone(phone);
        judge.setJGender(gender);
        judgeMapper.update(judge);

        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.updatePwd(judge.getJNo(), password);

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
