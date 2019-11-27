<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>@yield('title') - {{config('app.name')}} - Administrator</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="{{ asset('/css/backend/bootstrap.min.css') }}" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="{{ asset('/css/backend/animate.min.css') }}" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="{{ asset('/css/backend/light-bootstrap-dashboard.css?v=1.4.0') }}" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, dont include it in your project     -->
    <link href="{{ asset('/css/backend/demo.css') }}" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="{{ asset('/css/backend/font-awesome.min.css') }}" rel="stylesheet">
    <link href='{{ asset('/css/backend/font-css.css') }}' rel='stylesheet' type='text/css'>
    {{--  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>  --}}
    <link href="{{ asset('/css/backend/pe-icon-7-stroke.css') }}" rel="stylesheet" />
    {{-- <link href="{{ asset('/css/backend/datatables/jquery.dataTables.min.css') }}" rel="stylesheet" /> --}}
    <link href="{{ asset('/css/backend/datatables/material.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('/css/backend/datatables/dataTables.material.min.css') }}" rel="stylesheet" />
    {{-- <link href="{{ asset('/css/backend/datatables/bootstrap.css') }}" rel="stylesheet" /> --}}
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="{{ asset('/images/sidebar-5.jpg') }}">

    <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->
        @include('backend.layouts.navigation')
    </div>
    <div class="mainButton" style="margin-left: 220px;width: 25px;border-top-right-radius: 10px;border-bottom-right-radius: 10px;font-size: 25px;position: absolute;z-index: 9999;margin-top: 0px;">
        <a href="#" onclick="hideMenu(this)" class="menusControl"><i class="fa fa-times style" style="color:#fff;"></i> <p class="hideMenus"></p></a>
    </div>
    <div class="main-panel">
        @include('backend.layouts.top-navigation')
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                    @yield('content')
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
</body>

    <!--   Core JS Files   -->
    <script src="{{ asset('/js/backend/jquery.3.2.1.min.js') }}" type="text/javascript"></script>
	<script src="{{ asset('/js/backend/bootstrap.min.js') }}" type="text/javascript"></script>

	<!--  Datatables Plugin -->
	{{-- <script src="{{ asset('/js/backend/datatables/jquery-3.3.1.js') }}"></script> --}}
	<script src="{{ asset('/js/backend/datatables/jquery.dataTables.min.js') }}"></script>
	<script src="{{ asset('/js/backend/datatables/dataTables.material.min.js') }}"></script>

	<!--  Charts Plugin -->
	{{-- <script src="{{ asset('/js/backend/chartist.min.js') }}"></script> --}}
	<script src="{{ asset('/js/backend/chartist.min.js') }}"></script>

    <!--  Notifications Plugin    -->
    <script src="{{ asset('/js/backend/bootstrap-notify.js') }}"></script>

    <!--  Google Maps Plugin    -->
    <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="{{ asset('/js/backend/light-bootstrap-dashboard.js?v=1.4.0') }}"></script>

	<!-- Light Bootstrap Table DEMO methods, dont include it in your project! -->
    <script src="{{ asset('/js/backend/demo.js') }}"></script>
    
    <!--custom js-->
     @stack('scripts')


	{{--  <script type="text/javascript">
    	$(document).ready(function(){

        	$.notify({
            	icon: 'pe-7s-gift',
            	message: "Welcome to <b>Light Bootstrap Dashboard</b> - a beautiful freebie for every web developer."

            },{
                type: 'info',
                timer: 4000
            });

    	});
    </script>  --}}
</html>
