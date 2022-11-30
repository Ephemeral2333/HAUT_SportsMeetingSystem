package org.haut.servlet.Volunteer;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.User;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.UserMapper;
import org.haut.mapper.VolunteerMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteVolunServlet", value = "/volunteer/deleteByPK")
public class DeleteVolunServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SqlSession SqlSession = MyBatisUtil.openSession();
        String no = request.getParameter("vNo");
        VolunteerMapper volunteerMapper = SqlSession.getMapper(VolunteerMapper.class);
        volunteerMapper.deleteByVNo(no);

        RoleUserMapper roleUserMapper = SqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.deleteByPK(4, no);

        UserMapper userMapper = SqlSession.getMapper(UserMapper.class);
        userMapper.deleteByPK(no);

        SqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
