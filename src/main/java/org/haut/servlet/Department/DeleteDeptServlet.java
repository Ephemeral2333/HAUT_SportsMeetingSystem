package org.haut.servlet.Department;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.DepartmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteDeptServlet", value = "/department/deleteByPK")
public class DeleteDeptServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("dId");

        SqlSession sqlSession = MyBatisUtil.openSession();
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);

        departmentMapper.deleteByPK(Integer.valueOf(id));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
