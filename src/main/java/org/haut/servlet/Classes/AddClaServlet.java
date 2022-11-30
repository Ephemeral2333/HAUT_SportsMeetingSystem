package org.haut.servlet.Classes;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Classes;
import org.haut.mapper.ClassesMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddClaServlet", value = "/classes/add")
public class AddClaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String cname = request.getParameter("cName");
        String cmajor = request.getParameter("cMajor");
        Integer cHmid = Integer.parseInt(request.getParameter("cHeadmasterid"));
        Integer cDept = Integer.parseInt(request.getParameter("cDeptid"));

        SqlSession sqlSession = MyBatisUtil.openSession();
        ClassesMapper classesMapper = sqlSession.getMapper(ClassesMapper.class);

        Classes classes = new Classes();
        classes.setCName(cname);
        classes.setCMajor(cmajor);
        classes.setCHeadmasterid(cHmid);
        classes.setCDeptid(cDept);

        classesMapper.insert(classes);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
