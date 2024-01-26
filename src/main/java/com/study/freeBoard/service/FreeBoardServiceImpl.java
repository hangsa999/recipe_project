package com.study.freeBoard.service;

import org.springframework.stereotype.Service;
import com.study.common.vo.PagingVO;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.freeBoard.dao.IFreeBoardDao;
import com.study.freeBoard.vo.FreeBoardSearchVO;
import com.study.freeBoard.vo.FreeBoardVO;

import javax.inject.Inject;
import java.util.List;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {

    @Inject
    IFreeBoardDao freeBoardDao;

    @Override
    public List<FreeBoardVO> getBoardList(PagingVO paging) {
        int totalRowCount = freeBoardDao.getTotalRowCount(paging);
        paging.setTotalRowCount(totalRowCount);     // Row Count 주의
        paging.pageSetting();
        return freeBoardDao.getBoardList(paging);
    }

    @Override
    public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(boNo);  // DB를 정상적으로 실행 했겠지..
        if (freeBoard == null) {
            throw new BizNotFoundException();
        }

        return freeBoard;
    }

    @Override
    public void modifyBoard(FreeBoardVO freeBoard) throws BizPasswordNotMatchedException {

        //freeBoard는 사용자가 입력한 데이터
        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getBoNo());  //vo는 현재 DB에 있는 데이터

    }

    @Override
    public void removeBoard(FreeBoardVO freeBoard) throws BizPasswordNotMatchedException {

        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getBoNo());  //vo는 현재 DB에 있는 데이터
    }

    @Override
    public void registBoard(FreeBoardVO freeBoard) {
        freeBoardDao.insertBoard(freeBoard);    // boNo = 0,  DB에 넣을 때는 seq로 넣음. seq로 넣은 값을 boNo에 세팅하고 싶을 때는?
        // selectKey     insertBoard하고 나면 boNo=0 이 아니다.
    }


}
