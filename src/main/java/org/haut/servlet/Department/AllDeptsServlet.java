package org.haut.servlet.Department;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Department;
import org.haut.mapper.DepartmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllDeptsServlet", value = "/department/findAllDepts")
public class AllDeptsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Department> depts = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        DepartmentMapper mapper = sqlSession.getMapper(DepartmentMapper.class);
        depts = mapper.findAll();
        sqlSession.close();
        retData(response, depts);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Department> departmentList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(departmentList));
    }
}
