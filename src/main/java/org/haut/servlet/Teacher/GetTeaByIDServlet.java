package org.haut.servlet.Teacher;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Teacher;
import org.haut.mapper.TeacherMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetTeaByIDServlet", value = "/teacher/findById")
public class GetTeaByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        Teacher teacher = teacherMapper.selectByPK(Integer.parseInt(id));
        sqlSession.close();
        retData(response, teacher);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Teacher teacher) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(teacher));
    }
}
