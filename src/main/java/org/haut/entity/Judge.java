package org.haut.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.JudgeMapper;
import org.haut.util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
public class Judge {
    private Integer jId;
    private String jNo;
    private String jName;
    private boolean jGender;

    private String jPhone;
    private String jEmail;
    private String jIDcard;

    private List<Judge> judgeList;

    public Judge(int jId, String j_no, String jName, boolean jGender, String jPhone, String jEmail, String j_IDcard) {
        this.jId = jId;
        this.jNo = j_no;
        this.jName = jName;
        this.jGender = jGender;
        this.jPhone = jPhone;
        this.jEmail = jEmail;
        this.jIDcard = j_IDcard;
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);
        judgeList = judgeMapper.findAll();
        sqlSession.close();
    }

    public void selectByJID(int jId) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        JudgeMapper judgeMapper = sqlSession.getMapper(JudgeMapper.class);
        Judge judge = judgeMapper.selectByJID(jId);
        this.jId = judge.getJId();
        this.jNo = judge.getJNo();
        this.jName = judge.getJName();
        this.jGender = judge.isJGender();
        this.jPhone = judge.getJPhone();
        this.jEmail = judge.getJEmail();
        this.jIDcard = judge.getJIDcard();
        sqlSession.close();
    }
}
