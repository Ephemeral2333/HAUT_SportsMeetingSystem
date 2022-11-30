package org.haut.servlet.Judge;

import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.JudgeMapper;
import org.haut.mapper.RoleUserMapper;
import org.haut.mapper.UserMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteJudgeServlet", value = "/judge/deleteByPK")
public class DeleteJudgeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("jNo");
        SqlSession sqlSession = MyBatisUtil.openSession();
        JudgeMapper mapper = sqlSession.getMapper(JudgeMapper.class);
        mapper.deleteByJNo(id);
        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
        roleUserMapper.deleteByPK(3, id);
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.deleteByPK(id);
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
