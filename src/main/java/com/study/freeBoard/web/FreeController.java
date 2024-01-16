package com.study.freeBoard.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.freeBoard.service.IFreeBoardService;
import com.study.freeBoard.vo.FreeBoardSearchVO;
import com.study.freeBoard.vo.FreeBoardVO;

import javax.inject.Inject;
import java.util.List;

@Controller
public class FreeController {

    @Inject
    IFreeBoardService freeBoardService;

    @RequestMapping("/freeBoard/freeList.wow")
    public String freeList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") FreeBoardSearchVO search) {
        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(paging, search);
        model.addAttribute("freeBoardList", freeBoardList);
        return "freeBoard/freeList";
    }

    @GetMapping("/freeBoard/freeView.wow")
    public String freeView(Model model, int boNo) {
        try {
            FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
            model.addAttribute("freeBoard", freeBoard);
            return "freeBoard/freeView";
        } catch (BizNotFoundException bne) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "freeView 없음", "실패", "/freeBoard/freeList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @RequestMapping(value = "/freeBoard/freeEdit.wow")
    public String freeEdit(Model model, int boNo) {
        try {
            FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
            model.addAttribute("freeBoard", freeBoard);
            return "freeBoard/freeEdit";
        } catch (BizNotFoundException bne) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "freeEdit 없음", "실패", "/freeBoard/freeList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @PostMapping("/freeBoard/freeModify.wow")
    public String freeModify(Model model, FreeBoardVO freeBoard){

        try {
            freeBoardService.modifyBoard(freeBoard);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "freeModify 수정", "성공", "/freeBoard/freeList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        } catch (BizPasswordNotMatchedException bnf) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(false, "freeModify 수정", "실패", "/freeBoard/freeList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @PostMapping("/freeBoard/freeDelete.wow")
    public String freeDelete(Model model, FreeBoardVO freeBoard) {
        try {
            freeBoardService.removeBoard(freeBoard);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "freeDelete 삭제", "성공", "/freeBoard/freeList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        } catch (BizPasswordNotMatchedException bnf) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(false, "freeDelete 삭제", "실패", "/freeBoard/freeList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }
    }

    @RequestMapping("/freeBoard/freeForm.wow")
    public String freeForm(Model model) {
        return "freeBoard/freeForm";
    }

    @RequestMapping("/freeBoard/freeRegist.wow")
    public String freeRegist(Model model, FreeBoardVO freeBoard){
        freeBoardService.registBoard(freeBoard);
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "freeRegist 등록", "성공", "/freeBoard/freeList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }
}
