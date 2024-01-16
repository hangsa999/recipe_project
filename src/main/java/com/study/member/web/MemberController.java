package com.study.member.web;

import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;

@Controller
public class MemberController {

    @Inject
    IMemberService memberService;


    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") MemberSearchVO search) {
        List<MemberVO> memberList = memberService.getMemberList(paging, search);
        model.addAttribute("memberList", memberList);
        return "member/memberList";
    }

    @GetMapping("/member/memberView.wow")
    public String memberView(Model model, String memId) {
        try {
            MemberVO member = memberService.getMember(memId);
            model.addAttribute("member", member);
        } catch (BizNotFoundException bnf) {
            model.addAttribute("bnf", bnf);
        }

        return "member/memberView";
    }

    @RequestMapping("/member/memberEdit.wow")
    public String memberEdit(Model model, String memId) {
        try {
            MemberVO member = memberService.getMember(memId);
            model.addAttribute("member", member);
            return "member/memberEdit";
        } catch (BizNotFoundException bnf) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "memberEdit 없음", "실패", "/member/memberList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @PostMapping("/member/memberModify.wow")
    public String memberModify(Model model, MemberVO member) {
        try {
            memberService.modifyMember(member);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "memberModify 수정", "성공", "/member/memberList.wow", "목록으로");
            model.addAttribute("ResultMessageVO", resultMessageVO);
            return "common/message";
        } catch (BizNotFoundException bnf) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(false, "memberModify 수정", "실패", "/member/memberList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @PostMapping("/member/memberDelete.wow")
    public String memberDelete(Model model, MemberVO member) {
        try {
            memberService.removeMember(member);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "memberDelete 삭제", "성공", "/member/memberList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        } catch (BizNotFoundException bnf) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(false, "memberDelete 삭제", "실패", "/member/memberList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @RequestMapping("/member/memberForm.wow")
    public String memberForm(Model model) {
        return "member/memberForm";
    }

    @RequestMapping("/member/memberRegist.wow")
    public String memberRegist(Model model, MemberVO member) {
        try {
            memberService.registMember(member);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "memberRegist 등록", "성공", "/member/memberList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        } catch (BizDuplicateKeyException bdk) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(false, "memberRegist 등록", "실패", "/member/memberList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }
}
