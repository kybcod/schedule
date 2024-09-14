package com.example.scheduleproject.schedule;

import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Description("캘린더 보여주기")
    @GetMapping("/")
    public String home() {
        return "main/home";
    }
}
