package org.haut.servlet.Student;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Student;
import org.haut.mapper.StudentMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateStuServlet", value = "/student/update")
public class UpdateStuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("sId"));
        String no = request.getParameter("sNo");
        String name = request.getParameter("sName");
        String email = request.getParameter("sEmail");
        String phone = request.getParameter("sPhone");
        String idcard = request.getParameter("sIdcard");
        boolean gender = true;
        String genderStr = request.getParameter("sGender");
        boolean status = true;
        if(request.getParameter("status").equals("1"))
            status = true;
        else
            status = false;
        int classid = Integer.parseInt(request.getParameter("sClassid"));
        String password = request.getParameter("sPassword");

        PrintWriter out = response.getWriter();
        SqlSession session = MyBatisUtil.openSession();
        StudentMapper mapper = session.getMapper(StudentMapper.class);
        Student stu = mapper.selectByPK(id);
        stu.setSNo(no);
        stu.setSName(name);
        stu.setSEmail(email);
        stu.setSPhone(phone);
        stu.setSIdcard(idcard);
        stu.setSGenderStr(genderStr);
        stu.setSGender(gender);
        stu.setStatus(status);
        stu.setSClassid(classid);
        System.out.println(stu);
        mapper.update(stu);

        UserMapper userMapper = session.getMapper(UserMapper.class);
        userMapper.updatePwd(stu.getSNo(), password);
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
