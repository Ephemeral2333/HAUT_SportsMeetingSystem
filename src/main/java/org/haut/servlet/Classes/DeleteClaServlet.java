package org.haut.servlet.Classes;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.ClassesMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteClaServlet", value = "/classes/deleteByPK")
public class DeleteClaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Integer id = Integer.parseInt(request.getParameter("cId"));

        SqlSession session = MyBatisUtil.openSession();
        ClassesMapper mapper = session.getMapper(ClassesMapper.class);

        mapper.deleteByPK(id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
