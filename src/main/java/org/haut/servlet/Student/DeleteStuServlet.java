package org.haut.servlet.Student;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Student;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.StudentMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteStuServlet", value = "/student/deleteByPK")
public class DeleteStuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sNo");
        SqlSession sqlSession = MyBatisUtil.openSession();
        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
        studentMapper.deleteByPK(sno);
        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.deleteByPK(1, sno);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.deleteByPK(sno);
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
