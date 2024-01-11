package com.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;

@Controller
public class HomeController {

@Inject
IDao dao;

    @RequestMapping("/")
    public String home(Model model){
        int dual = dao.dual();
        model.addAttribute("dual",dual);
        return "home";
    }
}