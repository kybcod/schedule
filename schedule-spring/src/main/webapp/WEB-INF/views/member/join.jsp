<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
    </style>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mt-4 mb-4">회원가입</h3>
            <form action="/member/join" method="post">
                <div class="mb-3">
                    <div>
                        <label for="emailInput" class="form-label">이메일</label>
                        <div class="input-group">
                            <input name="email" id="emailInput" required type="email" class="form-control"
                                   placeholder="E-mail">
                            <button type="button" id="btnEmailCheck"
                                    class="btn btn-outline-secondary">중복 확인
                            </button>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="pwdInput" class="form-label">패스워드</label>
                        <input oninput="passwordCheck()" name="password" id="pwdInput" required type="password"
                               class="form-control"
                               placeholder="password">
                    </div>
                    <div class="mb-3">
                        <label for="pwdCheckInput" class="form-label">패스워드 확인</label>
                        <input id="pwdCheckInput" required type="password" class="form-control"
                               placeholder="password">
                        <div class="form-text" id="passwordMessage"></div>
                    </div>
                    <div class="mb-3">
                        <label for="nickInput" class="form-label">닉네임</label>
                        <input name="nickName" id="nickInput" required type="text" class="form-control"
                               placeholder="nick name">
                    </div>
                    <div>
                        <button class="btn btn-primary">가입</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
