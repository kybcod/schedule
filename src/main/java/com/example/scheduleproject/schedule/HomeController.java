package com.example.scheduleproject.schedule;

import com.example.scheduleproject.member.MemberService;
import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final MemberService memberService;
    private ScheduleService scheduleService;


    public HomeController(MemberService memberService) {
        this.memberService = memberService;
    }

    @Description("캘린더 보여주기")
    @GetMapping("/")
    public String home() {
        return "main/home";
    }

    @Description("캘린더 일정 추가하기")
    public void insert(){
        scheduleService.insertSchedule();
    }
}
