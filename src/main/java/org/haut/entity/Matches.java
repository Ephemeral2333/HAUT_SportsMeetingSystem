package org.haut.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.EventMapper;
import org.haut.mapper.MatchesMapper;
import org.haut.util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Matches {
    /**
     * 赛事id
     */
    private Integer mId;

    /**
     * 参赛人id
     */
    private String mNo;

    /**
     * 参赛项目
     */
    private Integer mEid;

    /**
     * 将参赛人分组分道
     */
    private String mSort;

    /**
     * 赛事成绩
     */
    private String mScore;

    /**
     * 成绩排名
     */
    private Integer mRank;

    private Event event;

    private User user;

    private List<Matches> matchesList;

    public void selectMatches(String uid) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        matchesList = matchesMapper.selectMyParticipate(uid);
        sqlSession.close();
    }

    public void selectMatchesBySId(Integer sId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        matchesList = matchesMapper.findBysId(sId);
        sqlSession.close();
    }

    public void selectMatchesByEId(Integer eId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        matchesList = matchesMapper.selectBymEid(eId);
        EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
        event = eventMapper.selectByPK(eId);
        sqlSession.close();
    }

    public void selectMatchesBymId(Integer mId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        Matches matches = matchesMapper.selectByPK(mId);
        mId = matches.getMId();
        mNo = matches.getMNo();
        mEid = matches.getMEid();
        mSort = matches.getMSort();
        mScore = matches.getMScore();
        mRank = matches.getMRank();
        user = matches.getUser();
        event = matches.getEvent();
        sqlSession.close();
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        matchesList = matchesMapper.findAll();
        sqlSession.close();
    }

    public void selectNoScore(Integer id) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MatchesMapper matchesMapper = sqlSession.getMapper(MatchesMapper.class);
        matchesList = matchesMapper.selectNotScores(id);
        sqlSession.close();
    }


    public List<Matches> getMatchesList() {
        return matchesList;
    }
}