<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>@yield('title') - {{config('app.name')}}</title>

  <!-- Bootstrap core CSS -->
  <link href="{{ asset('/css/bootstrap/bootstrap.min.css') }}" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="{{ asset('/css/blog-post.css') }}" rel="stylesheet">
  {{--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">  --}}

  <!-- Scripts -->
  {{--  <script src="{{ asset('js/app.js') }}" defer></script>  --}}

</head>

<body>

  <!-- Navigation -->
    @extends('frontend.layouts.navigation')
  <!-- Page Content -->
  <div class="container" style="height: 80.4%;">
    <div class="row">
        @yield('content')
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  @include('frontend.layouts.footer')

  <!-- Bootstrap core JavaScript -->
  <script src="{{ asset('/js/jquery/jquery.min.js') }}"></script>
  <script src="{{ asset('/js/bootstrap/bootstrap.min.js') }}"></script>
  <script src="{{ asset('/js/bootstrap/bootstrap.bundle.min.js') }}"></script>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <!--custom js-->
  @stack('scripts')


</body>

</html>
