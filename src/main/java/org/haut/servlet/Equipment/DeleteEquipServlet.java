package org.haut.servlet.Equipment;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Equipment;
import org.haut.mapper.EquipmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteEquipServlet", value = "/equipment/deleteById")
public class DeleteEquipServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        EquipmentMapper mapper = sqlSession.getMapper(EquipmentMapper.class);
        mapper.deleteById(Integer.valueOf(id));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
