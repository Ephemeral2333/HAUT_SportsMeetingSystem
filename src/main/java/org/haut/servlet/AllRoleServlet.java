package org.haut.servlet;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Role;
import org.haut.mapper.RoleMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllRoleServlet", value = "/role/findAll")
public class AllRoleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Role> roleList = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);
        roleList = roleMapper.findAll();
        sqlSession.close();
        retData(response, roleList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Role> roleList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(roleList));
    }
}
