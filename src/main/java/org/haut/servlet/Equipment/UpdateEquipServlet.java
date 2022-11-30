package org.haut.servlet.Equipment;

import org.apache.ibatis.session.SqlSession;
import org.haut.entity.Equipment;
import org.haut.mapper.EquipmentMapper;
import org.haut.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateEquipServlet", value = "/equip/update")
public class UpdateEquipServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String eid = request.getParameter("eId");
        String ename = request.getParameter("eName");
        String emodel = request.getParameter("eModel");
        String eplace = request.getParameter("ePlace");
        String esum = request.getParameter("eSum");
        String time = request.getParameter("eBuytime");

        SqlSession sqlSession = MyBatisUtil.openSession();
        EquipmentMapper mapper = sqlSession.getMapper(EquipmentMapper.class);
        Equipment equipment = mapper.selectByPK(Integer.valueOf(eid));
        equipment.setEName(ename);
        equipment.setEModel(emodel);
        equipment.setEPlace(eplace);
        equipment.setESum(Integer.valueOf(esum));
        equipment.setEBuytimeStr(time);
        mapper.update(equipment);

        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
