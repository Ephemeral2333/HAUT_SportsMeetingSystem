package org.haut.servlet.Borrow;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BorrowMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteBorrowServlet", value = "/borrow/deleteById")
public class DeleteBorrowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        borrowMapper.deleteById(Integer.valueOf(id));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
