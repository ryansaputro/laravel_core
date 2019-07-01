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

  <style>
    /* Start by setting display:none to make this hidden.
   Then we position it in relation to the viewport window
   with position:fixed. Width, height, top and left speak
   speak for themselves. Background we set to 80% white with
   our animation centered, and no-repeating */
    .load {
        display:    none;
        position:   fixed;
        z-index:    1000;
        top:        0;
        left:       0;
        height:     100%;
        width:      100%;
        background: rgba( 255, 255, 255, .8 ) 
                    url('https://3.bp.blogspot.com/-tqNEMUoveys/XHEx3U0mtCI/AAAAAAAACkg/ZDr8XOeRuOIVXIoaanSEu1m3z88cqWWsQCLcBGAs/s640/%2BLoading%2BGif%2BTransparent%2B%25281%2529.gif') 
                    50% 50% 
                    no-repeat;
    }

    /* When the body has the loading class, we turn
      the scrollbar off with overflow:hidden */
    body.loading {
        overflow: hidden;   
    }

    /* Anytime the body has the loading class, our
      modal element will be visible */
    body.loading .load {
        display: block;
    }
  </style>

</head>

<body>
  <!-- Navigation -->
    @extends('frontend.layouts.navigation')
  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="load"></div>
      {{-- <img src="https://www.mehruyan.com/image/loading.gif" id="loading-indicator" style="display:none" /> --}}
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

  <!-- Bootstrap core JavaScript -->
  <script src="{{ asset('/js/jquery/jquery.min.js') }}"></script>
  <script src="{{ asset('/js/bootstrap/bootstrap.min.js') }}"></script>
  <script src="{{ asset('/js/bootstrap/bootstrap.bundle.min.js') }}"></script>

{{--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">  --}}
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script>
    $body = $("body");

    $(document).on({
        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }    
    });
  </script>

  <!--custom js-->
  @stack('scripts')


</body>

</html>
