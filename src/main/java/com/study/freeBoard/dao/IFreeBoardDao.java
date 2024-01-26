package com.study.freeBoard.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.study.common.vo.PagingVO;
import com.study.freeBoard.vo.FreeBoardSearchVO;
import com.study.freeBoard.vo.FreeBoardVO;

import java.util.List;

@Mapper
public interface IFreeBoardDao {

    public int getTotalRowCount(@Param("paging") PagingVO paging);

    public List<FreeBoardVO> getBoardList(@Param("paging") PagingVO paging);

    public FreeBoardVO getBoard(int boNo);

    public int increaseHit(int boNo);

    public int updateBoard(FreeBoardVO freeBoard);

    public int deleteBoard(FreeBoardVO freeBoard);

    public int insertBoard(FreeBoardVO freeBoard);


}
