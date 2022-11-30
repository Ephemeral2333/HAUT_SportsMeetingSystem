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

@WebServlet(name = "UpdateClaServlet", value = "/classes/update")
public class UpdateClaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Integer id = Integer.parseInt(request.getParameter("cId"));
        String cname = request.getParameter("cName");
        String cmajor = request.getParameter("cMajor");
        Integer cHmid = Integer.parseInt(request.getParameter("cHeadmasterid"));
        Integer cDept = Integer.parseInt(request.getParameter("cDeptid"));

        SqlSession session = MyBatisUtil.openSession();
        ClassesMapper mapper = session.getMapper(ClassesMapper.class);
        Classes cla = mapper.selectByPK(id);
        cla.setCName(cname);
        cla.setCMajor(cmajor);
        cla.setCHeadmasterid(cHmid);
        cla.setCDeptid(cDept);
        mapper.update(cla);

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
