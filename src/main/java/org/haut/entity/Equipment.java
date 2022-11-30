package org.haut.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BorrowMapper;
import org.haut.mapper.EquipmentMapper;
import org.haut.util.Date.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.haut.util.MyBatisUtil;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class Equipment {
    /**
     * 器材id
     */
    private Integer eId;
    /**
     * 器材名称
     */
    private String eName;
    /**
     * 器材型号
     */
    private String eModel;
    /**
     * 器材放置地点
     */
    private String ePlace;
    /**
     * 器材总数
     */
    private Integer eSum;

    private Integer eSurplus;

    private Integer borrow;

    private List<Equipment> equipmentList;

    /**
     * 器材采购时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date eBuytime;
    private String eBuytimeStr;

    public Equipment(String eName, String eModel, String ePlace, Integer eSum, Date eBuytime) {
        this.eName = eName;
        this.eModel = eModel;
        this.ePlace = ePlace;
        this.eSum = eSum;
        this.eBuytime = eBuytime;
    }

    public String getEBuytimeStr() {
        if (eBuytime != null)
            eBuytimeStr = DateUtils.date2String(eBuytime, "yyyy-MM-dd HH:mm:ss");
        return eBuytimeStr;
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        EquipmentMapper mapper = sqlSession.getMapper(EquipmentMapper.class);
        equipmentList = mapper.findAll();
        sqlSession.close();
    }

//    public void selectByID(Integer eId) {
//        SqlSession sqlSession = MyBatisUtil.openSession();
//        EquipmentMapper mapper = sqlSession.getMapper(EquipmentMapper.class);
//        Equipment equipment = mapper.selectByPK(eId);
//        this.eId = equipment.getEId();
//        this.eName = equipment.getEName();
//        this.eModel = equipment.getEModel();
//        this.ePlace = equipment.getEPlace();
//        this.eSum = equipment.getESum();
//        this.eBuytime = equipment.getEBuytime();
//
//        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
//        List<Borrow> borrowList = borrowMapper.selectByeId(eId);
//        this.borrow = borrowList.size();
//
//        sqlSession.close();
//    }
}