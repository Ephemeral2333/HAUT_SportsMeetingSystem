package org.haut.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.BroadcastMapper;
import org.haut.mapper.EventMapper;
import org.haut.mapper.MatchesMapper;
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
public class Sportmeeting {
    /**
     * 运动会id
     */
    private Integer sId;
    /**
     * 运动会名称
     */
    private String sName;
    /**
     * 运动会主题
     */
    private String sTheme;
    /**
     * 举办地点
     */
    private String sPlace;
    /**
     * 举办时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sDate;
    private String sDateStr;
    /**
     * 开始时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sStarttime;
    private String sStarttimeStr;
    /**
     * 结束时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sEndtime;
    private String sEndtimeStr;
    /**
     * 描述
     */
    private String sDescription;
    /**
     * 运动会开启关闭状态
     */
    private Boolean sStatus;


    private List<Broadcast> broadcast;

    private List<Event> eventList;

    private List<Matches> matchesList;

    private List<Sportmeeting> sportmeetingList;

    public String getSDateStr() {
        if (sDate != null)
            sDateStr = DateUtils.date2String(sDate, "yyyy-MM-dd HH:mm:ss");
        return sDateStr;
    }

    public String getSStarttimeStr() {
        if (sStarttime != null)
            sStarttimeStr = DateUtils.date2String(sStarttime, "yyyy-MM-dd HH:mm:ss");
        return sStarttimeStr;
    }

    public String getSEndtimeStr() {
        if (sEndtime != null)
            sEndtimeStr = DateUtils.date2String(sEndtime, "yyyy-MM-dd HH:mm:ss");
        return sEndtimeStr;
    }

    public void findAll() {
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        SportmeetingMapper mapper = sqlSession.getMapper(SportmeetingMapper.class);
        sportmeetingList = mapper.findAll();
        sqlSession.close();
    }

    public List<Sportmeeting> getSportmeetingList() {
        return sportmeetingList;
    }

    public void selectSportmeetingById(int sId) {
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        SportmeetingMapper mapper = sqlSession.getMapper(SportmeetingMapper.class);
        Sportmeeting sportmeeting = mapper.selectByPK(sId);

        this.sId = sportmeeting.getSId();
        this.sName = sportmeeting.getSName();
        this.sTheme = sportmeeting.getSTheme();
        this.sPlace = sportmeeting.getSPlace();
        this.sDate = sportmeeting.getSDate();
        this.sStarttime = sportmeeting.getSStarttime();
        this.sEndtime = sportmeeting.getSEndtime();
        this.sDescription = sportmeeting.getSDescription();
        this.sStatus = sportmeeting.getSStatus();

        EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
        this.eventList = eventMapper.findBysId(sId);

        BroadcastMapper broadcastMapper = sqlSession.getMapper(BroadcastMapper.class);
        this.broadcast = broadcastMapper.selectBybSportmeetingid(sId);

        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        this.matchesList = matchesMapper.findBysId(sId);

        sqlSession.close();
    }
}