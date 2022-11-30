package org.haut.servlet.Borrow;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Borrow;
import org.haut.mapper.BorrowMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddBorrowServlet", value = "/borrow/add")
public class AddBorrowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String bno = request.getParameter("bNo");
        String beid = request.getParameter("bEid");
        String bnum = request.getParameter("bNum");
        String bDesc = request.getParameter("bDescription");

        Borrow borrow = new Borrow();
        borrow.setBNo(bno);
        borrow.setBEid(Integer.valueOf(beid));
        borrow.setBNum(Integer.valueOf(bnum));
        borrow.setBDescription(bDesc);

        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        borrowMapper.insert(borrow);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
