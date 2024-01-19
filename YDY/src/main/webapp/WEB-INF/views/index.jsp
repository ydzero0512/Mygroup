  	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  	<!-- header && sidebar include -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header && sidebar include -->
  <body class="vertical light">
    <div class="wrapper">
      <jsp:include page="nav.jsp"></jsp:include>
      <main role="main" class="main-content">
      	<div class="container-fluid">
      	        <h2>근태관리 </h2>
      		
      		 <div class="col-12">
      		  <h4 style="text-align: center;"> < 2024.01 > </h4>
      		  <div class="row my-4">
				<div class="col-md-3">
                  <div class="card shadow mb-4">
                    <div class="card-body">
                      <h3 class="h5 mb-1"><p class="time" id="timer">01:17:37</p></h3>
                      <p class="text-muted mb-4">How to integrate the theme?</p>
                      <ul class="list-unstyled">
                        <li class="my-1"><i class="fe fe-file-text mr-2 text-muted"></i>출근시간</li>
                        <li class="my-1"><i class="fe fe-file-text mr-2 text-muted"></i>퇴근시간</li>
                        <li class="my-1"><i class="fe fe-file-text mr-2 text-muted"></i>주간 누적 근무시간</li>
                        <li class="my-1"><i class="fe fe-file-text mr-2 text-muted"></i>Facilisis in pretium</li>
                        <li class="my-1"><i class="fe fe-file-text mr-2 text-muted"></i>Nulla volutpat aliquam velit</li>
                      </ul>
                      <button type="button" class="btn mb-2 btn-primary">출근</button>
                      <button type="button" class="btn mb-2 btn-primary">퇴근</button>
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
        </div>
        
        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="list-group list-group-flush my-n3">
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-box fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Package has uploaded successfull</strong></small>
                        <div class="my-0 text-muted small">Package is zipped and uploaded</div>
                        <small class="badge badge-pill badge-light text-muted">1m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-download fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Widgets are updated successfull</strong></small>
                        <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
                        <small class="badge badge-pill badge-light text-muted">2m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-inbox fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Notifications have been sent</strong></small>
                        <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
                        <small class="badge badge-pill badge-light text-muted">30m ago</small>
                      </div>
                    </div> <!-- / .row -->
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-link fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Link was attached to menu</strong></small>
                        <div class="my-0 text-muted small">New layout has been attached to the menu</div>
                        <small class="badge badge-pill badge-light text-muted">1h ago</small>
                      </div>
                    </div>
                  </div> <!-- / .row -->
                </div> <!-- / .list-group -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade modal-shortcut modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body px-5">
                <div class="row align-items-center">
                  <div class="col-6 text-center">
                    <div class="squircle bg-success justify-content-center">
                      <i class="fe fe-cpu fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Control area</p>
                  </div>
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-activity fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Activity</p>
                  </div>
                </div>
                <div class="row align-items-center">
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-droplet fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Droplet</p>
                  </div>
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Upload</p>
                  </div>
                </div>
                <div class="row align-items-center">
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-users fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Users</p>
                  </div>
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-settings fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Settings</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </main> <!-- main -->
    </div> <!-- .wrapper -->
     <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/moment.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/simplebar.min.js"></script>
    <script src='/resources/js/daterangepicker.js'></script>
    <script src='/resources/js/jquery.stickOnScroll.js'></script>
    <script src="/resources/js/tinycolor-min.js"></script>
    <script src="/resources/js/config.js"></script>
    <script src="/resources/js/d3.min.js"></script>
    <script src="/resources/js/topojson.min.js"></script>
    <script src="/resources/js/datamaps.all.min.js"></script>
    <script src="/resources/js/datamaps-zoomto.js"></script>
    <script src="/resources/js/datamaps.custom.js"></script>
    <script src="/resources/js/Chart.min.js"></script>
    
    
    <script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="/resources/js/gauge.min.js"></script>
    <script src="/resources/js/jquery.sparkline.min.js"></script>
    <script src="/resources/js/apexcharts.min.js"></script>
    <script src="/resources/js/apexcharts.custom.js"></script>
    <script src='/resources/js/jquery.mask.min.js'></script>
    <script src='/resources/js/select2.min.js'></script>
    <script src='/resources/js/jquery.steps.min.js'></script>
    <script src='/resources/js/jquery.validate.min.js'></script>
    <script src='/resources/js/jquery.timepicker.js'></script>
    <script src='/resources/js/dropzone.min.js'></script>
    <script src='/resources/js/uppy.min.js'></script>
    <script src='/resources/js/quill.min.js'></script>
       <script src="/resources/js/apps.js"></script>
       <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script>
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
    <script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! Weâve uploaded these files:', result.successful)
        });
      }
    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
  </body>
</html>