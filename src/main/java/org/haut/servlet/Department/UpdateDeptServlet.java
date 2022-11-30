package org.haut.servlet.Department;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Department;
import org.haut.mapper.DepartmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateDeptServlet", value = "/department/update")
public class UpdateDeptServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String dId = request.getParameter("dId");
        String dName = request.getParameter("dName");
        String dDeanid = request.getParameter("dDeanid");

        SqlSession sqlSession = MyBatisUtil.openSession();
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);

        Department department = departmentMapper.selectByPK(Integer.valueOf(dId));
        department.setDName(dName);
        department.setDDeanid(Integer.valueOf(dDeanid));

        departmentMapper.update(department);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
