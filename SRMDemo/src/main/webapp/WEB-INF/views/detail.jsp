<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


	<!--  데이트 피커  CDN -->

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js" integrity="sha512-k6/Bkb8Fxf/c1Tkyl39yJwcOZ1P4cRrJu77p83zJjN2Z55prbFHxPs9vN7q3l3+tSMGPDdoH51AEU8Vgo1cgAA==" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" integrity="sha512-3JRrEUwaCkFUBLK1N8HehwQgu8e23jTH4np5NHOmQOobuC4ROQxFwFgBLTnhcnQRMs84muMh0PnnwXlPq5MGjg==" crossorigin="anonymous" />

	<!--  데이트 피커 CDN 끝 -->

	<!-- datatables https://datatables.net/-->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
	
	<script>
		console.log(${data})
		$(document).ready( function () {
	    	$('#PoTable').DataTable({
	    		
	    		// 상태 저장
		    	bStateSave: true,
		    	// 표시 건수기능 숨기기
		    	lengthChange: true,
		    	// 검색 기능 숨기기
		    	searching: false,
		    	// 정렬 기능 숨기기
		    	ordering: true,
		    	// 정보 표시 숨기기
		    	info: true,
		    	// 페이징 기능 숨기기
		    	paging: false,
		    	
		    	// 가로 스크롤바를 표시
		    	// 설정 값은 true 또는 false
		    	scrollX: true,

		    	// 세로 스크롤바를 표시
		    	// 설정 값은 px단위
		    	scrollY: 400,
		    	
		    	data: ${data},
		    	
		    	columns: [
		    		{ data: 'po_number' },
		     		{ data: 'po_number' },
		     		{ data: 'send' },
		          	{ data: 'receive'},
		           	{ data: 'start_date'},
		           	{ data: 'end_date'},
		           	{ data: 'price'},
		           	{ data: 'user_name' }
		           	
		     	],
		     	
		     	 columnDefs: [{
		             targets: 0,
		             searchable: false,
		             orderable: false,
		             className: 'dt-body-center',
		             render: function (data, type, full, meta){
		                 return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
		             }
		          }],
		          order: [[1, 'asc']]
		    		    	
		    	
	    	});

		} );
		
		
	</script>
	
	<script>
	$(document).ready( function () {
    	$('#PoTable2').DataTable({
    		
    		// 상태 저장
	    	bStateSave: true,
	    	// 표시 건수기능 숨기기
	    	lengthChange: true,
	    	// 검색 기능 숨기기
	    	searching: false,
	    	// 정렬 기능 숨기기
	    	ordering: true,
	    	// 정보 표시 숨기기
	    	info: true,
	    	// 페이징 기능 숨기기
	    	paging: false,
	    	
	    	// 가로 스크롤바를 표시
	    	// 설정 값은 true 또는 false
	    	scrollX: true,

	    	// 세로 스크롤바를 표시
	    	// 설정 값은 px단위
	    	scrollY: 400,
	    	
	    	columnDefs: [{
	             targets: 0,
	             searchable: false,
	             orderable: false,
	             className: 'dt-body-center',
	             render: function (data, type, full, meta){
	                 return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
	             }
	          }],
	          order: [[1, 'asc']]
    		
    	});

	} );
	</script>
	<!--  datatables end -->
	
	
	
    <title>DETAIL</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css?after" rel="stylesheet">
    

	<%
	
		session = request.getSession();
    	String memberName = (String)session.getAttribute("memberName");
        String memberId = (String)session.getAttribute("memberId");
	
	%>
	<% if (memberId == null){ %>
			<script>
			alert("세션 만료 다시 로그인 하세요.");
 			document.location.href="/";
 			</script>
	<% } %>
    
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
     <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        <!-- End of Sidebar -->




        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" sclass="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="resources/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="resources/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="resources/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> <%=memberName %> </span>
                                <img class="img-profile rounded-circle"
                                    src="resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">SRM SLB</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

					
					
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Earnings (Monthly)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Earnings (Annual)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pending Requests</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
				<!--  search contents Row-->
				<div class="row">
					
					
					<!-- Topbar Search -->
					
                    <form class = "form-inline">
                    
                       <div class = "col-xl-4 lg-12 md-12">
                        <div class = "form-group">
                            <input type="text" style = "width:100%;" class="form-control bg-white border-20" name = "search" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                         </div>
                        </div>
		                     <!--  데이트 피커  -->
		                     <div class = "col-xl-3 lg-12 md-12">
		                        <div class="form-group">
		                         
		                          <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
		                           <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" value="" name = "startDate" placeholder = "YYYY-MM-DD">
		                            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
		                             <div class="input-group-text"><i class="fa fa-calendar"></i>
		                               </div>
		                              </div>
		                             </div>
		                          </div>
		                      </div>
		                      
		                      <div class = "col-xl-0 lg-0 md-0 xs-0">
		                          <b>~</b>
                              </div>
                         
                         <div class = "col-xl-3 lg-12 md-12">
                           <div class="form-group">
                            
                              <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" value="" name = "endDate" placeholder = "YYYY-MM-DD">
                                     <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                                     <div class="input-group-text"><i class="fa fa-calendar"></i>
                                 </div>
                              </div>
                             
                           </div>
                          </div>
                        </div>
                     <!--  데이트 피커  끝-->
                     
                     <!-- search button -->
                            <div>
                                <button class="btn btn-primary" type="button" id = "search_button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                         </form>
                        
                       
                       </div>
				
					
					
					
                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-12 col-lg-12">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">발주 리스트</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
									<!--  발주리스트 내용 -->
									
									<table id="PoTable" class="display nowrap dataTable dtr-inline collapsed"
										style="width: 100%;" role="grid" aria-describedby="example_info">
										<thead>
											<tr role="row">
											
												<th class="sorting sorting_desc" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														style="width: 10px;"
														aria-label="checkBox: activate to sort column ascending"
														aria-sort="descending"><input type="checkbox" name="select_all" value="0" id="PoTable-select-all"></th>
												
												<th class="sorting sorting_desc" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 108px;"
													aria-label="Name: activate to sort column ascending"
													aria-sort="descending">po_number</th>
													
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" style="width: 176px;"
													aria-label="Position: activate to sort column ascending">send</th>
													
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" style="width: 80px;"
													aria-label="Office: activate to sort column ascending">receive</th>
													
												<th class="sorting" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 80px;"
													aria-label="Age: activate to sort column ascending">start_date</th>
													
												<th class="dt-body-right sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" style="width: 29px;"
													aria-label="Start date: activate to sort column ascending">end_date</th>
													
												<th class="dt-body-right sorting" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 29px;"
													aria-label="Salary: activate to sort column ascending">price</th>
													
												<th class="dt-body-right sorting" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 29px;"
													aria-label="Salary: activate to sort column ascending">user_name</th>
											</tr>
											
											
										</thead>
										
										
										
								
									</table>


								</div>
                            </div>
                        </div>

                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-xl-12 col-lg-12 mb-12">

                            <!-- 발주 리스트 세부 내용 Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">발주 리스트 세부 내용</h6>
                                </div>
                                <div class="card-body">
                               		<!--  발주리스트 세부 내용이 들어갈 자리 -->
                               		
                               		<table id="PoTable2" class="display nowrap dataTable dtr-inline collapsed"
										style="width: 100%;" role="grid" aria-describedby="example_info">
										<thead>
											<tr role="row">
											
												<th class="sorting sorting_desc" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														style="width: 10px;"
														aria-label="checkBox: activate to sort column ascending"
														aria-sort="descending"><input type="checkbox" name="select_all" value="0" id="PoTable-select-all"></th>
												
												<th class="sorting sorting_desc" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 108px;"
													aria-label="Name: activate to sort column ascending"
													aria-sort="descending">po_number</th>
													
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" style="width: 176px;"
													aria-label="Position: activate to sort column ascending">send</th>
													
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" style="width: 80px;"
													aria-label="Office: activate to sort column ascending">receive</th>
													
												<th class="sorting" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 80px;"
													aria-label="Age: activate to sort column ascending">start_date</th>
													
												<th class="dt-body-right sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1" style="width: 29px;"
													aria-label="Start date: activate to sort column ascending">end_date</th>
													
												<th class="dt-body-right sorting" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 29px;"
													aria-label="Salary: activate to sort column ascending">price</th>
													
												<th class="dt-body-right sorting" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													style="width: 29px;"
													aria-label="Salary: activate to sort column ascending">user_name</th>
											</tr>
											
											
										</thead>
                               		
                               		
                               		</table>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>


	<!-- 데이트피커 함수 포멧 설정, 최소최대 날짜 설정-->
	<script>
		$(function () {
			console.log("데이트타임피커 설정 함수 동작...");
			$('#datetimepicker1').datetimepicker({ format: 'YYYY-MM-DD'});
			$('#datetimepicker2').datetimepicker({ format: 'YYYY-MM-DD', useCurrent: false });
			$("#datetimepicker1").on("change.datetimepicker", function (e) {
				$('#datetimepicker2').datetimepicker('minDate', e.date); });
			$("#datetimepicker2").on("change.datetimepicker", function (e) {
				$('#datetimepicker1').datetimepicker('maxDate', e.date);
				});
			});
	</script>
	<!-- 데이트피커 함수 포멧 설정, 최소최대 날짜 설정 끝-->
	
	
	<script>
	
		console.log("검색버튼 부분...");
		function click_searchAndDate(){
			
					var search = $('input[name="search"]').val();
					var startDate = $('input[name="startDate"]').val();
					var endDate = $('input[name="endDate"]').val();
					var name = "<%=memberName%>";
					//var check = $('#customCheck').val();
				     // JSON으로 요청
				     
				     console.log(search + startDate + endDate);
					if (search == "" && startDate == "" && endDate == ""){
						alert("검색어 미입력");
	              	 	window.location.href="/detail";
					}
				     
				     
				     var send_data = {"userName": name, "search" : search, "startDate" : startDate, "endDate" : endDate};
				     
				     $.ajax({
				
				              url: "/listSearch",
				
				              type: "POST",
				
				              dataType: "json",          // ajax 통신으로 받는 타입
				
				              contentType: "application/json",  // ajax 통신으로 보내는 타입
				
				              data: JSON.stringify(send_data),
				
				              success: function(data){
				            	  
				            	  if(data.msg == 'NONE'){
				            		  alert("검색결과가 없습니다.");
				
				            	  }else if(data.msg == 'EXIST'){
				            		var table = $("#PoTable").DataTable();
				              		table.destroy();
				              		
				            		alert("검색결과 입니다.");
				            		console.log(data);
				            		
				            		$('#PoTable').DataTable({
				            			
				            			// 상태 저장
				        		    	bStateSave: true,
				        		    	// 표시 건수기능 숨기기
				        		    	lengthChange: true,
				        		    	// 검색 기능 숨기기
				        		    	searching: false,
				        		    	// 정렬 기능 숨기기
				        		    	ordering: true,
				        		    	// 정보 표시 숨기기
				        		    	info: true,
				        		    	// 페이징 기능 숨기기
				        		    	paging: false,
				        		    	
				        		    	// 가로 스크롤바를 표시
				        		    	// 설정 값은 true 또는 false
				        		    	scrollX: true,

				        		    	// 세로 스크롤바를 표시
				        		    	// 설정 값은 px단위
				        		    	scrollY: 400,
				        		    	
				   
				        		    
				        		    	data: data.poList,
				        		    	 columns: [
				        		    		{ data: 'po_number' },
				        		     		{ data: 'po_number' },
				        		     		{ data: 'send' },
				        		          	{ data: 'receive'},
				        		           	{ data: 'start_date'},
				        		           	{ data: 'end_date'},
				        		           	{ data: 'price'},
				        		           	{ data: 'user_name' }
				        		           	
				        		     	],
				        		     	
				       		     	 columnDefs: [{
				       		             targets: 0,
				       		             searchable: false,
				       		             orderable: false,
				       		             className: 'dt-body-center',
				       		             render: function (data, type, full, meta){
				       		                 return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
				       		             }
				       		          }],
				       		          order: [[1, 'asc']]
				        		    	
				        	    	});
				              	  }
				              },
						      error: function(data){
						    	  alert("REST 오류 발생");
				              	 	window.location.href="/index";
		
						      }
				
				     });
				     
		
			}
		
		document.getElementById("search_button").addEventListener("click", click_searchAndDate);
		console.log("검색버튼 클릭...");
	</script>
	
	<script>
	// Handle click on "Select all" control
	   $('#PoTable-select-all').on('click', function(){
	      // Get all rows with search applied
	      var rows = $('#PoTable').DataTable().rows({ 'search': 'applied' }).nodes();
	      // Check/uncheck checkboxes for all rows in the table
	      $('input[type="checkbox"]', rows).prop('checked', this.checked);
	   });
	</script>
	
	<script>
	// Handle click on checkbox to set state of "Select all" control
	   $('#PoTable tbody').on('change', 'input[type="checkbox"]', function(){
	      // If checkbox is not checked
	      if(!this.checked){
	         var el = $('#example-select-all').get(0);
	         // If "Select all" control is checked and has 'indeterminate' property
	         if(el && el.checked && ('indeterminate' in el)){
	            // Set visual state of "Select all" control
	            // as 'indeterminate'
	            el.indeterminate = true;
	         }
	      }
	   });
	</script>
	
	<script>
	
	// Handle form submission event -> 체크박스 서브밋 함수 -> 서브밋 버튼을 만들어야함. 
	   $('#frm-example').on('submit', function(e){
	      var form = this;

	      // Iterate over all checkboxes in the table
	      table.$('input[type="checkbox"]').each(function(){
	         // If checkbox doesn't exist in DOM
	         if(!$.contains(document, this)){
	            // If checkbox is checked
	            if(this.checked){
	               // Create a hidden element
	               $(form).append(
	                  $('<input>')
	                     .attr('type', 'hidden')
	                     .attr('name', this.name)
	                     .val(this.value)
	               );
	            }
	         }
	      });
	   });
	</script>


	<script>
	// 클릭시 상세 내용
	
		$(document).ready(function(){
			console.log("클릭시 상세내용 함수 동작...")
			var table = $('#PoTable').DataTable();
			 
			$('#example tbody').on( 'click', 'tr', function () {
				this_row = table.rows(this).data();
				$('#PoTable2').html(table.row( this ).data());
			} );
		});
	
	</script>
	 

    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../resources/js/demo/chart-area-demo.js"></script>
    <script src="../resources/js/demo/chart-pie-demo.js"></script>



</body>

</html>