package com.study.reply.dao;

import com.study.common.vo.PagingVO;
import com.study.reply.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface IReplyDao {
	public int getReplyCountByParent(@Param("paging") PagingVO paging, @Param("reCategory") String reCategory,@Param("reParentNo") int reParentNo);

	public List<ReplyVO> getReplyListByParent(@Param("paging")PagingVO paging, @Param("reCategory") String reCategory, @Param("reParentNo") int reParentNo);

	public ReplyVO getReply(int reNo);

	public int updateReply(ReplyVO reply);

	public int deleteReply(ReplyVO reply);

	public int insertReply(ReplyVO reply);
}
