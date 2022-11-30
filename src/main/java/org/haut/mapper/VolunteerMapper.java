package org.haut.mapper;

import org.apache.ibatis.annotations.*;
import org.haut.entity.Volunteer;
import java.util.List;

@Mapper
public interface VolunteerMapper {
    void insertVolunteer(String v_id, String v_name, String v_email);
    String selectEmailByVid(String v_id);
    String selectNameByVid(String v_id);
    List<Volunteer> findAll();
    void update(Volunteer volunteer);
    void insert(Volunteer volunteer);
    void deleteByVNo(String no);
    Volunteer selectByVID(int vId);
}
