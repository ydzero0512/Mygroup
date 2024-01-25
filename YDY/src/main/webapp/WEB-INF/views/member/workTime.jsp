<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@include file="../common/topnav.jsp"%>
<%@include file="../common/sidenav.html"%>
<style>
#workStart,#workEnd{
	width : 100%; border-radius : 20px; height : 40px; margin-bottom : 15px;
}
.card-header{
	height : 50px;
}
strong{
	font-size: 18px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
    var csrfToken = document.querySelector("meta[name='_csrf']").content; //security에서는 해당값을 추가줘야함!
    var csrfHeader = document.querySelector("meta[name='_csrf_header']").content;
	var time = new Date().toTimeString().split(' ')[0];
    var memberId =  document.getElementById('memberId').value;
    var obj = {
            "memberId": memberId
       		   }; // var obj end  		   
       		//// 오늘의 근태확인 
       		 axios.get('/member/workTimeList?memberId='+memberId+"&today=ok", {
       	         headers: {
       	             'Content-Type': 'application/json',
       	             [csrfHeader]: csrfToken,
       	         }
       	     })
       	     .then(function (response) {
       	      const workStartTime = response.data[0].workStartTime;
       	      const workEndTime = response.data[0].workEndTime;
       	    	$('#workStartTime').html(workStartTime);
       	    	$('#workStart').prop('disabled', true);
       	    	if(workEndTime){
           	    	$('#workEndTime').html(workEndTime);
           	    	$('#workEnd').prop('disabled', true);
       	    	}
       	     });//// 오늘의 근태확인 
       	     
        		//// 금주 누적 / 초과 / 잔여 
       		 axios.get('/member/workTimeSum?memberId='+memberId+"&isData=week", {
       	         headers: {
       	             'Content-Type': 'application/json',
       	             [csrfHeader]: csrfToken,
       	         }
       	     })
       	     .then(function (response) {
       	      const leftThisWeek = response.data[0].leftThisWeek;
       	      const sumThisWeek = response.data[0].sumThisWeek;
       	  	  const overThisWeek = response.data[0].overThisWeek;
       	   		
       	    	$('#sumThisWeek1').html(sumThisWeek);
       	    	$('#sumThisWeek2').html(sumThisWeek);
       	    	$('#leftThisWeek').html(leftThisWeek);
       	    	$('#overThisWeek').html(overThisWeek);

       	     });//// 금주 누적 / 초과 / 잔여 
       	     
        		//// 오늘의 근태확인 
       		 axios.get('/member/workTimeSum?memberId='+memberId+"&isData=month", {
       	         headers: {
       	             'Content-Type': 'application/json',
       	             [csrfHeader]: csrfToken,
       	         }
       	     })
       	     .then(function (response) {
       	      const sumThisMonth = response.data[0].sumThisMonth;
     	      $('#sumThisMonth').html(sumThisMonth);
       	    	
       	     });//// 오늘의 근태확인 
       	     
       		 axios.get('/member/workTimeList?memberId='+memberId+"&today=no", {
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
       	                     outputHtml += "<td>" + work.workDate + "</td>";  
       	                     outputHtml += "<td>" + work.workStartTime + "</td>";  
       	                     outputHtml += "<td>" + work.workEndTime + "</td>";
       	                	 outputHtml += "<td>" + work.todayWorkTime + "</td>";
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
       		
		navigator.geolocation.getCurrentPosition((position) => {
			console.log(position);
			$('#workStart').click(function(){
				var latitude = position.coords.latitude;
				if(latitude>=35 && latitude<36 ){
		
					$('#workStartTime').html(time);
		
		                axios.post('/member/workStartTime', obj, {
		                    headers: {
		                        'Content-Type': 'application/json',
		                        [csrfHeader]: csrfToken,
		                    }
		                })
		                .then(function (response) {
		                	if(response.data =="ok"){
		                    alert("출근성공!!");
		                    location.reload();
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
		
					$('#workEndTime').html(time);
		            axios.post('/member/workEndTime', obj, {
		                headers: {
		                    'Content-Type': 'application/json',
		                    [csrfHeader]: csrfToken,
		                }
		            })
		            .then(function (response) {
		            	if(response.data =="ok"){
		                alert("퇴근 성공!!");
		                location.reload();
		               	}
		            })
		            .catch(function (error) {
		                alert('error');
		            });
					
				}else{
					alert("사무실 위치에서 퇴근 해주세요!");
				}
			}); // 퇴근버튼 
	
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
									<dd id="sumThisWeek1"></dd>
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
                          <h3 class="mb-0" id="sumThisWeek2"></h3> <!-- 누적시간 -->
                        </div>
                      </div>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
                </div> <!-- .col -->
                <div class="col-md-6 col-xl-3 mb-4">
                  <div class="card shadow mb-4">
                    <div class="card-header">
                      <span class="card-title">이번주 초과</span>
                    </div>
                    <div class="card-body my-n2">
                      <div class="d-flex">
                        <div class="flex-fill">
                          <h3 class="mb-0" id="overThisWeek"></h3> <!-- 초과시간 -->
                        </div>
                        
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
                          <h3 class="mb-0" id="leftThisWeek"></h3>
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
                          <h3 class="mb-0" id="sumThisMonth"></h3>
                        </div>
                      </div>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
                </div> <!-- .col -->
              </div>
                  <div class="accordion w-100" id="accordion1">
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

