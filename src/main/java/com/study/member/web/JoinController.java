package com.study.member.web;

import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

@Controller
public class JoinController {

    @Inject
    private IMemberService memberService;

    @ResponseBody
    @RequestMapping("/member/idcheck.wow")
    public boolean idcheck(String memId) {
        try {
            memberService.getMember(memId);
            return false;
        } catch (BizNotFoundException e) {
            e.printStackTrace();
            return true;
        }
    }
}


