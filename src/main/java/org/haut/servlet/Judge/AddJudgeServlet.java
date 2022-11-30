package org.haut.servlet.Judge;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Judge;
import org.haut.mapper.JudgeMapper;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.TeacherMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddJudgeServlet", value = "/judge/add")
public class AddJudgeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

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

        Judge judge = new Judge();
        judge.setJNo(tno);
        judge.setJName(tname);
        judge.setJEmail(email);
        judge.setJIDcard(idcard);
        judge.setJPhone(phone);
        judge.setJGender(gender);

        SqlSession sqlSession = MyBatisUtil.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.insert(tno, password, status);

        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.insert(3, tno);

        JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);
        judgeMapper.insert(judge);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
