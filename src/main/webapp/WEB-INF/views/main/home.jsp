<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
    </style>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div id='calendar'></div> <!-- FullCalendar가 그려질 곳 -->

<!-- 모달 추가 -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">일정 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="eventForm">
                    <div class="mb-3">
                        <label for="eventTitle" class="form-label">일정 제목</label>
                        <input type="text" class="form-control" id="eventTitle" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="eventDesc" class="form-label">일정 설명</label>
                        <textarea class="form-control" id="eventDesc" name="description"></textarea>
                    </div>
                    <input type="hidden" id="eventDate" name="date">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="saveEvent">추가</button>
            </div>
        </div>
    </div>
</div>

<!-- FullCalendar 및 Bootstrap JS -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> <!-- Axios CDN -->

<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      locale: 'ko',
      initialView: 'dayGridMonth',
      events: '/events',
      dateClick: function(info) {
        // 모달 열기
        var eventDate = info.dateStr;  // 클릭한 날짜 가져오기
        document.getElementById('eventDate').value = eventDate;  // 숨겨진 필드에 날짜 저장
        var eventModal = new bootstrap.Modal(document.getElementById('eventModal'), {});
        eventModal.show();
      }
    });
    calendar.render();

    // 일정 추가 버튼 클릭 시 폼 데이터 전송
    document.getElementById('saveEvent').addEventListener('click', function() {
      var title = document.getElementById('eventTitle').value;
      var description = document.getElementById('eventDesc').value;
      var date = document.getElementById('eventDate').value;

      // 입력 검증
      if (title.trim() === "") {
        alert("제목을 입력해주세요.");
        return;
      }

      // 서버로 데이터 전송 (Axios 요청 사용)
      var eventData = {
        title: title,
        description: description,
        start: date
      };

      axios.post('/addEvent', eventData)
        .then(function (response) {
          if (response.data.success) {
            calendar.addEvent({
              title: title,
              start: date
            });
            document.getElementById('eventForm').reset();  // 폼 리셋
            var eventModal = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
            eventModal.hide();  // 모달 닫기
          } else {
            alert("일정 추가 중 오류가 발생했습니다.");
          }
        })
        .catch(function (error) {
          console.error('Error:', error);
        });
    });
  });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
