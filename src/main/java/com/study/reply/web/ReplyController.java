package com.study.reply.web;

import com.study.common.vo.PagingVO;
import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import com.study.reply.service.IReplyService;
import com.study.reply.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
public class ReplyController {

    @Inject
    IReplyService replyService;


    @ResponseBody
    @RequestMapping("/reply/replyList")
    public List<ReplyVO> replyList(PagingVO paging, String reCategory, int reParentNo) {
        return replyService.getReplyListByParent(paging, reCategory, reParentNo);
    }

    @RequestMapping("/freeBoard/replyList")
    public String  freeReplyList(Model model, PagingVO paging, String reCategory, int reParentNo) {
        List<ReplyVO> replyList = replyService.getReplyListByParent(paging, reCategory, reParentNo);
        model.addAttribute("replyList", replyList);
        return "freeBoard/replyList";
    }

    @ResponseBody
    @RequestMapping("/reply/insertReply")
    public void insertReply(@ModelAttribute ReplyVO reply) {
        replyService.registReply(reply);
    }

    @ResponseBody
    @RequestMapping("/reply/replyModify")
    public void replyModify(@ModelAttribute ReplyVO reply) {
        try {
            replyService.modifyReply(reply);
        } catch (BizNotFoundException e) {
            e.printStackTrace();
        } catch (BizAccessFailException e) {
            throw new RuntimeException(e);
        }
    }

    @ResponseBody
    @RequestMapping("/reply/replyDelete")
    public void replyDelete(@ModelAttribute ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
        replyService.removeReply(reply);
    }

}
