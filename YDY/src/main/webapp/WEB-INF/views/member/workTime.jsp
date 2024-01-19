<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@include file="../common/topnav.jsp"%>
<%@include file="../common/sidenav.html"%>

<script type="text/javascript">
$(document).ready(function(){
navigator.geolocation.getCurrentPosition((position) => {
	console.log(position);
	$('#workStart').click(function(){
		var latitude = position.coords.latitude;
		if(latitude>=35 && latitude<36 ){
			alert("출근성공 ");
			var startTime = new Date().toTimeString().split(' ')[0];
			$('#workStartTime').val(startTime);
		}else{
			alert("사무실 위치에서 출근해주세요!");
		}
	}); // 출근버튼 
	
	$('#workEnd').click(function(){
		var latitude = position.coords.latitude;
		if(latitude>=35 && latitude<36 ){
			alert("퇴근성공 ");
			var endTime = new Date().toTimeString().split(' ')[0];
			$('#workEndTime').val(endTime);
		}else{
			alert("사무실 위치에서 퇴근 해주세요!");
		}
	}); // 퇴근버튼 
});

});
</script>
<div class="col-12">
      		  <h4 style="text-align: center;"> < 2024.01 > </h4>
      		  <div class="row my-4">
				<div class="col-md-3">
                  <div class="card shadow mb-4">
                    <div class="card-body">
                      <h3 class="h5 mb-1"><p class="time" id="timer">01:17:37</p></h3>
                     
                     <div>
						<ul style="padding-inline-start: 10px;">
							<li>
								<dl>
									<dt>출근시간</dt>
									<dd id="workInTime">09:50:00</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>퇴근시간</dt>
									<dd id="workOutTime">미등록</dd>
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
                      <button type="button" class="btn mb-2 btn-primary" id="workStart" >출근</button>
                      <button type="button" class="btn mb-2 btn-primary" id="workEnd">퇴근</button>
                    </div>
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
                            <th>ID</th>
                            <th>Name</th>
                            <th>Company</th>
                            <th>Address</th>
                            <th>Date</th>
                            <th>Status</th>
                          </tr>
                        </thead>
                        <tbody>
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


<%@include file="../common/footer.html"%>
