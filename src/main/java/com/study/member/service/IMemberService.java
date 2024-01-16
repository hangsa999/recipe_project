package com.study.member.service;

import com.study.common.vo.PagingVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

import java.util.List;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(PagingVO paging, MemberSearchVO search);
	public MemberVO getMember(String memId) throws BizNotFoundException;
	public void modifyMember(MemberVO member) throws BizNotFoundException;
	public void removeMember(MemberVO member) throws BizNotFoundException;
	public void registMember(MemberVO member) throws BizDuplicateKeyException;
}
