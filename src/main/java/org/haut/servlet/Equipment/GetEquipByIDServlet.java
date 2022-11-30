package org.haut.servlet.Equipment;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Equipment;
import org.haut.entity.Event;
import org.haut.mapper.EquipmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetEquipByIDServlet", value = "/equipment/findById")
public class GetEquipByIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        EquipmentMapper mapper = sqlSession.getMapper(EquipmentMapper.class);
        Equipment equipment = mapper.selectByPK(Integer.valueOf(id));
        retData(response, equipment);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Equipment equipment) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(equipment));
    }
}
