package org.haut.servlet.Teacher;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.TeacherMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteTeaServlet", value = "/teacher/deleteByPK")
public class DeleteTeaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tid = request.getParameter("tId");
        SqlSession sqlSession = MyBatisUtil.openSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        teacherMapper.deleteByPK(tid);
        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.deleteByPK(2, tid);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.deleteByPK(tid);
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
