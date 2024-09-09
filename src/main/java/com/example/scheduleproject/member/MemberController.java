package com.example.scheduleproject.member;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @Description("회원가입 페이지 Form 형식 보기")
    @GetMapping("join")
    public void joinForm() {}

    @Description("회원가입")
    @PostMapping("join")
    public String join(Member member) {
        memberService.join(member);
        return "redirect:/member/login";
    }

    @Description("로그인 페이지 Form 형식 보기")
    @GetMapping("login")
    public String loginForm() {
        return "member/login";
    }

}
