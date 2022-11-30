package org.haut.servlet.Volunteer;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.User;
import org.haut.entity.Volunteer;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.UserMapper;
import org.haut.mapper.VolunteerMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddVolunServlet", value = "/volunteer/add")
public class AddVolunServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tno = request.getParameter("vNo");
        String tname = request.getParameter("vName");
        String email = request.getParameter("vEmail");
        String phone = request.getParameter("vPhone");
        String genderStr = request.getParameter("vGender");
        boolean gender = true;
        if(genderStr.equals("男")) {
            gender = true;
        } else {
            gender = false;
        }
        String identity = request.getParameter("vIdentity");
        boolean status = true;
        if(request.getParameter("status").equals("1"))
            status = true;
        else
            status = false;
        String idcard = request.getParameter("vIdcard");
        String password = request.getParameter("password");

        Volunteer volunteer = new Volunteer();
        volunteer.setVNo(tno);
        volunteer.setVName(tname);
        volunteer.setVEmail(email);
        volunteer.setVIdcard(idcard);
        volunteer.setVPhone(phone);
        volunteer.setVGender(gender);

        SqlSession sqlSession = MyBatisUtil.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.insert(tno, password, status);

        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.insert(4, tno);

        VolunteerMapper volunteerMapper = sqlSession.getMapper(VolunteerMapper.class);
        volunteerMapper.insert(volunteer);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
