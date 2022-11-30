package org.haut.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.VolunteerMapper;
import org.haut.util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
public class Volunteer {
    private Integer vId;
    private String vNo;
    private String vName;
    private boolean vGender;
    private String vPhone;
    private String vEmail;
    private String vIdcard;
    private List<Volunteer> volunteerList;

    public Volunteer(int vId, String vNo, String vName, boolean vGender, String vPhone, String vEmail, String vIdcard) {
        this.vId = vId;
        this.vNo = vNo;
        this.vName = vName;
        this.vGender = vGender;
        this.vPhone = vPhone;
        this.vEmail = vEmail;
        this.vIdcard = vIdcard;
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        VolunteerMapper volunteerMapper = sqlSession.getMapper(VolunteerMapper.class);
        volunteerList = volunteerMapper.findAll();
        sqlSession.close();
    }

    public void selectByVID(Integer vid) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        VolunteerMapper volunteerMapper = sqlSession.getMapper(VolunteerMapper.class);
        Volunteer volunteer = volunteerMapper.selectByVID(vid);
        this.vId = volunteer.getVId();
        this.vNo = volunteer.getVNo();
        this.vName = volunteer.getVName();
        this.vGender = volunteer.isVGender();
        this.vPhone = volunteer.getVPhone();
        this.vEmail = volunteer.getVEmail();
        this.vIdcard = volunteer.getVIdcard();
        sqlSession.close();
    }
}
