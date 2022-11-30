package org.haut.servlet.Borrow;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BorrowMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateBorrowServlet", value = "/borrow/update")
public class UpdateBorrowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        borrowMapper.update(Integer.valueOf(id));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
