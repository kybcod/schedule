package com.example.scheduleproject.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @PostMapping("join")
    public String join(Member member) {
        memberService.join(member);
        return "redirect:/login";
    }
}
