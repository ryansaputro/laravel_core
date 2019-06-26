<!DOCTYPE html>
<html lang="en">
@php
    $metas = DB::table('meta')->select('*')->where('status', '1')->get();
@endphp
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  @foreach ($metas as $k => $meta)
  <meta name="{{$meta->name}}" content="{{ $meta->content }}">
  @endforeach

  <title>@yield('title') - {{config('app.name')}}</title>

  <!-- Bootstrap core CSS -->
  <link href="{{ asset('/css/bootstrap/bootstrap.min.css') }}" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="{{ asset('/css/blog-post.css') }}" rel="stylesheet">

  <!-- Scripts -->
  {{--  <script src="{{ asset('js/app.js') }}" defer></script>  --}}

  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  <script>
    (adsbygoogle = window.adsbygoogle || []).push({
      google_ad_client: "ca-pub-8588459032506014",
      enable_page_level_ads: true
    });
  </script>
</head>

<body>

  <!-- Navigation -->
    @extends('frontend.layouts.navigation')
  <!-- Page Content -->
  <div class="container">
    <div class="row">
        @yield('content')
      <!-- Sidebar Widgets Column -->
      {{-- <div class="col-md-2"> --}}

        <!-- ads one -->
            {{-- @include('frontend.layouts.ads-one') --}}
        <!-- ads two -->
            {{-- @include('frontend.layouts.ads-two') --}}
        <!-- ads three -->
            {{-- @include('frontend.layouts.ads-three') --}}

      {{-- </div> --}}

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

{{--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">  --}}
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

  <!--custom js-->
  @stack('scripts')


</body>

</html>
