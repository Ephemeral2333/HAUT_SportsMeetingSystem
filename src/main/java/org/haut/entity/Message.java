package org.haut.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.haut.mapper.MessageMapper;
import org.haut.util.Date.DateUtils;
import org.haut.util.MyBatisUtil;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class Message {
    private Integer mId;
    private String mSno;
    private String mTitle;
    private String mContent;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date mTime;

    private String mTimeStr;
    private String mSender;
    private boolean mStatus;
    private Student student;
    private List<Message> messageList;

    public Message(String mSno, String mTitle, String mContent, Date mTime, String mSender, boolean mStatus) {
        this.mSno = mSno;
        this.mTitle = mTitle;
        this.mContent = mContent;
        this.mTime = mTime;
        this.mSender = mSender;
        this.mStatus = mStatus;
    }

    public String getMTimeStr() {
        if (mTime != null)
            mTimeStr = DateUtils.date2String(mTime, "yyyy-MM-dd HH:mm:ss");
        return mTimeStr;
    }

    public void selectByVNo(String vNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
        messageList = messageMapper.selectByVNo(vNo);
        sqlSession.close();
    }
}
