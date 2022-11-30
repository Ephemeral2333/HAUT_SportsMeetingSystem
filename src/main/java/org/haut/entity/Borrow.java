package org.haut.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BorrowMapper;
import org.haut.util.Date.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.haut.util.MyBatisUtil;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class Borrow {

    /**
     * 借出id
     */
    private Integer bId;
    /**
     * 借用人id
     */
    private String bNo;
    /**
     * 借出器材id
     */
    private Integer bEid;
    /**
     * 借出数量
     */
    private Integer bNum;
    /**
     * 借出时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date bStarttime;
    private String bStarttimeStr;
    /**
     * 归还时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date bEndtime;
    private String bEndtimeStr;
    /**
     * 归还状态
     */
    private Boolean bState;
    /**
     * 借用理由
     */
    private String bDescription;
    private List<Borrow> borrowList;
    private Equipment equipment;
    private User user;

    public Borrow(String bNo, Integer bEid, Integer bNum, Date bStarttime, Date bEndtime, Boolean bState, String bDescription) {
        this.bNo = bNo;
        this.bEid = bEid;
        this.bNum = bNum;
        this.bStarttime = bStarttime;
        this.bEndtime = bEndtime;
        this.bState = bState;
        this.bDescription = bDescription;
    }

    public String getBStarttimeStr() {
        if (bStarttime != null)
            bStarttimeStr = DateUtils.date2String(bStarttime, "yyyy-MM-dd HH:mm:ss");
        return bStarttimeStr;
    }

    public String getBEndtimeStr() {
        if (bEndtime != null)
            bEndtimeStr = DateUtils.date2String(bEndtime, "yyyy-MM-dd HH:mm:ss");
        return bEndtimeStr;
    }

    public static List<Borrow> createBorrowList(String uid) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        List<Borrow> borrowList = borrowMapper.selectBybNo(uid);
        sqlSession.close();
        return borrowList;
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        borrowList = borrowMapper.findAll();
        sqlSession.close();
    }

    public void findAllOff() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        borrowList = borrowMapper.findAllOff();
        sqlSession.close();
    }

    public void selectByeID(Integer eId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
        borrowList = borrowMapper.selectByeId(eId);
        sqlSession.close();
    }
}