<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@include file="../common/topnav.jsp"%>
<%@include file="../common/sidenav.html"%>
<style>
#workStart,#workEnd{
	width : 100%; border-radius : 20px; height : 40px; margin-bottom : 15px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
    var csrfToken = document.querySelector("meta[name='_csrf']").content; //security에서는 해당값을 추가줘야함!
    var csrfHeader = document.querySelector("meta[name='_csrf_header']").content;
    var memberId =  document.getElementById('memberId').value;
    var obj = {
            "memberId": memberId
       		   }; // var obj end  		   
  		   
navigator.geolocation.getCurrentPosition((position) => {
	console.log(position);
	$('#workStart').click(function(){
		var latitude = position.coords.latitude;
		if(latitude>=35 && latitude<36 ){
			var startTime = new Date().toTimeString().split(' ')[0];
			$('#workStartTime').html(startTime);

                axios.post('/member/workStartTime', obj, {
                    headers: {
                        'Content-Type': 'application/json',
                        [csrfHeader]: csrfToken,
                    }
                })
                .then(function (response) {
                	if(response.data =="ok"){
                    alert("출근성공!!");
                   	}
                })
                .catch(function (error) {
                    alert('error');
                });
			
		}else{
			alert("사무실 위치에서 출근해주세요!");
		}
	}); // 출근버튼 
	
	$('#workEnd').click(function(){
		var latitude = position.coords.latitude;
		if(latitude>=35 && latitude<36 ){
			var endTime = new Date().toTimeString().split(' ')[0];
			$('#workEndTime').html(endTime);
            axios.post('/member/workEndTime', obj, {
                headers: {
                    'Content-Type': 'application/json',
                    [csrfHeader]: csrfToken,
                }
            })
            .then(function (response) {
            	if(response.data =="ok"){
                alert("퇴근 성공!!");
               	}
            })
            .catch(function (error) {
                alert('error');
            });
			
		}else{
			alert("사무실 위치에서 퇴근 해주세요!");
		}
	}); // 퇴근버튼 
	
	//// 근태 목록 
	 axios.get('/member/workTimeList?memberId='+memberId, {
         headers: {
             'Content-Type': 'application/json',
             [csrfHeader]: csrfToken,
         }
     })
     .then(function (response) {
    	 
    	 const workList = response.data;
    	 var outputHtml = "";
         const groupedData = workList.reduce((result, item) => {
             const week = item.week;

             // 해당 주차가 없으면 새로운 배열 생성
             if (!result[week]) {
                 result[week] = [];
             }

             // 주차에 해당하는 데이터 추가
             result[week].push(item);
			 return result;
             
         }, {});
         for (const week in groupedData) {
             outputHtml += "<div class='card shadow'>";
             outputHtml += "<div class='card-header' id='heading" + week + "'>";
             outputHtml += "<a role='button' href='#collapse" + week + "' data-toggle='collapse' data-target='#collapse" + week + "' aria-expanded='false' aria-controls='collapse" + week + "' class='collapsed'>";
             outputHtml += "<strong><span class='fe fe fe-chevron-down'></span> " + week + "주차 </strong>";
             outputHtml += "</a>";
             outputHtml += "</div>";
             outputHtml += "<div id='collapse" + week + "' class='collapse' aria-labelledby='heading" + week + "' data-parent='#accordion1' style=''>";
             outputHtml += "<div class='card-body'><table class='table table-hover'>";
             outputHtml += "<thead>";
             outputHtml += "<tr>";
             outputHtml += "<th>일지</th>";
             outputHtml += "<th>업무시작</th>";
             outputHtml += "<th>업무종료</th>";
             outputHtml += "<th>총 근무시간</th>";
             outputHtml += "</tr>";
             outputHtml += "</thead>";
             outputHtml += "<tbody>";
             if (groupedData.hasOwnProperty(week)) {
                 // 주차에 해당하는 데이터 가져옴
                 const weeklyData = groupedData[week];
                 for (var i = 0; i < weeklyData.length; i++) {
                     var work = weeklyData[i];
                     outputHtml += "<tr>";
                     outputHtml += "<td>" + work.workDate + "</td>";  // 예시 필드
                     outputHtml += "<td>" + work.workStartTime + "</td>";  // 예시 필드
                     outputHtml += "<td>" + work.workEndTime + "</td>";  // 예시 필드
                     outputHtml += "</tr>";
                 }
               }
             outputHtml += "</tbody>";
             outputHtml += "</table></div></div></div>";
         }
         document.getElementById("accordion1").innerHTML = outputHtml;

	
     })
     .catch(function (error) {
         alert('error');
     });
	//// 근태 목록 
});

});
</script>
<div class="col-12">

			<h3>근태관리</h3>
			<sec:authentication property="principal.member" var="member" />	
			<input type="hidden" id="memberId" value=" ${member.memberId}">
      		  <h4 style="text-align: center;"> < 2024.01 > </h4>
      		  <div class="row my-4">
				<div class="col-md-3">
                  <div class="card shadow mb-4">
                    <div class="card-body">
                    <h3 id="today"></h3>
                      <h1 id="clock"></h1>
                     	<hr>
                     <div>
						<ul style="padding-inline-start: 10px;">
							<li>
								<dl>
									<dt>출근시간</dt>
									<dd id="workStartTime">미등록 </dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>퇴근시간</dt>
									<dd id="workEndTime">미등록</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>주간 누적 근무시간</dt>
									<dd id="weeklyTotalTime">28h 26m 0s</dd>
								</dl>
							</li>
						</ul>
  					 </div>
                    </div>
                  </div>
                  <div>
                      <button type="button" class="btn btn-primary" id="workStart" >출근하기</button>
                      <button type="button" class="btn btn-primary" id="workEnd">퇴근하기</button>
                  </div>
                </div>
        <div class="col-md-9">
        <div class="row">
                <div class="col-md-6 col-xl-3 mb-4">
                  <div class="card shadow">
                    <div class="card-header">
                      <span class="card-title">이번주 누적</span>
                      <a class="float-right small text-muted" href="#!"><i class="fe fe-more-vertical fe-12"></i></a>
                    </div>
                    <div class="card-body my-n2">
                      <div class="d-flex">
                        <div class="flex-fill">
                          <h4 class="mb-0">120</h4>
                        </div>
                        <div class="flex-fill text-right">
                          <p class="mb-0 small">+20%</p>
                          <p class="text-muted mb-0 small">last week</p>
                        </div>
                      </div>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
                </div> <!-- .col -->
                <div class="col-md-6 col-xl-3 mb-4">
                  <div class="card shadow mb-4">
                    <div class="card-header">
                      <span class="card-title">이번주 초과</span>
                      <a class="float-right small text-muted" href="#!"><span>+1.8%</span></a>
                    </div>
                    <div class="card-body my-n1">
                      <div class="d-flex">
                        <div class="flex-fill">
                          <h4 class="mb-0">2068</h4>
                        </div>
                        <div class="flex-fill text-right">
                          <span class="sparkline inlinebar"><canvas width="40" height="32" style="display: inline-block; width: 40px; height: 32px; vertical-align: top;"></canvas></span></div>
                      </div>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
                </div> <!-- .col -->
                <div class="col-md-6 col-xl-3 mb-4">
                  <div class="card shadow">
                    <div class="card-header">
                      <span class="card-title">이번주 잔여</span>
                      <a class="float-right small text-muted" href="#!"><i class="fe fe-more-vertical fe-12"></i></a>
                    </div>
                    <div class="card-body my-n2">
                      <div class="d-flex">
                        <div class="flex-fill">
                          <h4 class="mb-0">120</h4>
                        </div>
                        <div class="flex-fill text-right">
                          <p class="mb-0 small">+20%</p>
                          <p class="text-muted mb-0 small">last week</p>
                        </div>
                      </div>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
                </div> <!-- .col -->
                <div class="col-md-6 col-xl-3 mb-4">
                  <div class="card shadow">
                    <div class="card-header">
                      <span class="card-title">이번달 누적</span>
                      <a class="float-right small text-muted" href="#!"><i class="fe fe-more-vertical fe-12"></i></a>
                    </div>
                    <div class="card-body my-n2">
                      <div class="d-flex">
                        <div class="flex-fill">
                          <h4 class="mb-0">120</h4>
                        </div>
                        <div class="flex-fill text-right">
                          <p class="mb-0 small">+20%</p>
                          <p class="text-muted mb-0 small">last week</p>
                        </div>
                      </div>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
                </div> <!-- .col -->
              </div>
                  <div class="accordion w-100" id="accordion1">
                    <div class="card shadow">
                      <div class="card-header" id="heading1">
                        <a role="button" href="#collapse1" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1" class="collapsed">
                          <strong><span class="fe fe fe-chevron-down"></span> 1주차 </strong>
                        </a>
                      </div>
                      <div id="collapse1" class="collapse" aria-labelledby="heading1" data-parent="#accordion1" style="">
                        <div class="card-body"><table class="table table-hover">
                        <thead>
                          <tr>
                            <th>일지<th>
                            <th>업무시작</th>
                            <th>업무종료</th>
                            <th>총 근무시간</th>
                            <th>근무시간 상세</th>
                          </tr>
                        </thead>
                        <tbody id="aa">
                          <tr>
                            <td>3224</td>
                            <td>Keith Baird</td>
                            <td>Enim Limited</td>
                            <td>901-6206 Cras Av.</td>
                            <td>Apr 24, 2019</td>
                            <td><span class="badge badge-pill badge-warning">Hold</span></td>
                          </tr>
                          <tr>
                            <td>3218</td>
                            <td>Graham Price</td>
                            <td>Nunc Lectus Incorporated</td>
                            <td>Ap #705-5389 Id St.</td>
                            <td>May 23, 2020</td>
                            <td><span class="badge badge-pill badge-success">Success</span></td>
                          </tr>
                          <tr>
                            <td>2651</td>
                            <td>Reuben Orr</td>
                            <td>Nisi Aenean Eget Limited</td>
                            <td>7425 Malesuada Rd.</td>
                            <td>Nov 4, 2019</td>
                            <td><span class="badge badge-pill badge-warning">Hold</span></td>
                          </tr>
                          <tr>
                            <td>2636</td>
                            <td>Akeem Holder</td>
                            <td>Pellentesque Associates</td>
                            <td>896 Sodales St.</td>
                            <td>Mar 27, 2020</td>
                            <td><span class="badge badge-pill badge-danger">Danger</span></td>
                          </tr>
                          <tr>
                            <td>2757</td>
                            <td>Beau Barrera</td>
                            <td>Augue Incorporated</td>
                            <td>4583 Id St.</td>
                            <td>Jan 13, 2020</td>
                            <td><span class="badge badge-pill badge-success">Success</span></td>
                          </tr>
                        </tbody>
                      </table> </div>
                      </div>
                    </div>
                    <div class="card shadow">
                      <div class="card-header" id="heading1">
                        <a role="button" href="#collapse2" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                          <strong><span class="fe fe fe-chevron-down"></span> 2주차 </strong>
                        </a>
                      </div>
                      <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordion1">
                        <div class="card-body"> . </div>
                      </div>
                    </div>
                    <div class="card shadow">
                      <div class="card-header" id="heading1">
                        <a role="button" href="#collapse3" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                          <strong><span class="fe fe fe-chevron-down"></span> 3주차 </strong>
                        </a>
                      </div>
                      <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordion1">
                        <div class="card-body"> . </div>
                      </div>
                    </div>
                                      <div class="card shadow">
                      <div class="card-header" id="heading1">
                        <a role="button" href="#collapse4" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                          <strong><span class="fe fe fe-chevron-down"></span> 4주차 </strong>
                        </a>
                      </div>
                      <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordion1">
                        <div class="card-body"> . </div>
                      </div>
                    </div>
                                      <div class="card shadow">
                      <div class="card-header" id="heading1">
                        <a role="button" href="#collapse5" data-toggle="collapse" data-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                          <strong><span class="fe fe fe-chevron-down"></span> 5주차 </strong>
                        </a>
                      </div>
                      <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordion1">
                        <div class="card-body"> . </div>
                      </div>
                    </div>
                  </div>
                </div>     
          </div>
          </div>

    <script>
    	//실시간 시계 
        function updateClock() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();

            // Format the time as HH:mm:ss
            var formattedTime = hours + ":" + padZero(minutes) + ":" + padZero(seconds);

            // Update the content of the 'clock' element
            document.getElementById("clock").textContent = formattedTime;
        }

        function padZero(number) {
            return number < 10 ? "0" + number : number;
        }

        // Update the clock every second
        setInterval(updateClock, 1000);

        // Initial update
        updateClock();
        
        //오늘 날짜 
        function getDate() {
	    const currentDate = new Date();
		
	    const year = currentDate.getFullYear();
	    const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고, 1자리 수일 경우 0을 추가
	    const day = String(currentDate.getDate()).padStart(2, '0');
	    
	    var weekdayArr = new Array(7);
	    weekdayArr[0] = "일";
	    weekdayArr[1] = "월";
	    weekdayArr[2] = "화";
	    weekdayArr[3] = "수";
	    weekdayArr[4] = "목";
	    weekdayArr[5] = "금";
	    weekdayArr[6] = "토";

	    var weekday = weekdayArr[currentDate.getDay()];
	
	    const formattedDate = year+'-'+month+'-'+day+"("+weekday+")";
	    
	    document.getElementById("today").textContent = formattedDate;
        }
        getDate();
       
    </script>
<%@include file="../common/footer.html"%>

