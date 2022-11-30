package org.haut.servlet.Classes;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Classes;
import org.haut.entity.Role;
import org.haut.mapper.ClassesMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllClassServlet", value = "/classes/findAllClasses")
public class AllClassServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Classes> classesList = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        ClassesMapper classesMapper = sqlSession.getMapper(ClassesMapper.class);
        classesList = classesMapper.findAll();
        retData(response, classesList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Classes> classesList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(classesList));
    }
}
