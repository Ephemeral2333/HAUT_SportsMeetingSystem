package org.haut.mapper;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.haut.entity.Judge;

import java.util.List;

public interface JudgeMapper {
    void insertJudge(String j_id, String j_name, String j_email);
    String selectEmailByJid(String j_id);
    String selectNameByJid(String j_id);
    List<Judge> findAll();
    Judge selectByPK(Integer jid);
    void update(Judge judge);
    void insert(Judge judge);
    void deleteByJNo(String no);
    Judge selectByJID(int jId);
}
