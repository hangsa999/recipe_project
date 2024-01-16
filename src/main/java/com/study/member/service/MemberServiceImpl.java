package com.study.member.service;

import com.study.common.vo.PagingVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class MemberServiceImpl implements IMemberService {

    @Inject
    IMemberDao memberDao;

    @Override
    public List<MemberVO> getMemberList(PagingVO paging, MemberSearchVO search) {
            int totalRowCount = memberDao.getTotalRowCount(paging, search);
            paging.setTotalRowCount(totalRowCount);     // Row Count 주의
            paging.pageSetting();
            return memberDao.getMemberList(paging, search);
    }

    @Override
    public MemberVO getMember(String memId) throws BizNotFoundException {
            MemberVO member = memberDao.getMember(memId);    // DB는 정상 실행
            if (member == null) {
                throw new BizNotFoundException();
            }
            return member;
    }

    @Override
    public void modifyMember(MemberVO member) throws BizNotFoundException {
            MemberVO vo = memberDao.getMember(member.getMemId());
            if (member.getMemId().equals(vo.getMemId())) {
                // memId가 일치하는 경우 (아이디가 있는 경우)
                memberDao.updateMember(member);
            } else {
                throw new BizNotFoundException("없는 사용자임");
            }
    }

    @Override
    public void removeMember(MemberVO member) throws BizNotFoundException {
            MemberVO vo = memberDao.getMember(member.getMemId());
            if (member.getMemId().equals(vo.getMemId())) {
                // memId가 일치하는 경우 (아이디가 있는 경우)
                memberDao.deleteMember(member);
            } else {
                throw new BizNotFoundException("없는 사용자임");
            }
    }

    @Override
    public void registMember(MemberVO member) throws BizDuplicateKeyException {
            MemberVO vo = memberDao.getMember(member.getMemId());
            if (vo == null) {
                memberDao.insertMember(member);
            } else {
                // memId 가 이미 있는 경우
                throw new BizDuplicateKeyException("이미 사용중인 memId");
            }
    }
}
