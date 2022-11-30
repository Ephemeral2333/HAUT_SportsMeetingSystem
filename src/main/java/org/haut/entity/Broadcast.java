package org.haut.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BroadcastMapper;
import org.haut.mapper.SportmeetingMapper;
import org.haut.util.Date.DateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.haut.util.MyBatisUtil;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Broadcast {
    /**
     * 广播id
     */
    private Integer bId;
    /**
     * 广播主题
     */
    private String bTitle;
    /**
     * 广播内容
     */
    private String bContent;
    /**
     * 播出时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date bTime;
    private String bTimeStr;
    /**
     * 运动会id
     */
    private Integer bSportmeetingid;

    private Sportmeeting sportmeeting;

    private Integer sId;
    private String sName;
    private Integer total;
    List<Broadcast> broadcastsList;

    public String getBTimeStr() {
        if (bTime != null)
            bTimeStr = DateUtils.date2String(bTime, "yyyy-MM-dd HH:mm:ss");
        return bTimeStr;
    }

    public void selectBroadcastBySportmeetingId(Integer sId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BroadcastMapper broadcastMapper = sqlSession.getMapper(BroadcastMapper.class);
        broadcastsList = broadcastMapper.selectBybSportmeetingid(sId);
        SportmeetingMapper sportmeetingMapper = sqlSession.getMapper(SportmeetingMapper.class);
        sportmeeting = sportmeetingMapper.selectByPK(sId);
        sqlSession.close();
    }

    public List<Broadcast> getBroadcastsList() {
        return broadcastsList;
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BroadcastMapper broadcastMapper = sqlSession.getMapper(BroadcastMapper.class);
        broadcastsList = broadcastMapper.findAll();
        sqlSession.close();
    }
}