package org.haut.servlet.Department;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Classes;
import org.haut.entity.Department;
import org.haut.mapper.ClassesMapper;
import org.haut.mapper.DepartmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetDeptByIDServlet", value = "/department/findById")
public class GetDeptByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        Department department = departmentMapper.selectByPK(Integer.parseInt(id));
        sqlSession.close();
        retData(response, department);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Department department) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(department));
    }
}
