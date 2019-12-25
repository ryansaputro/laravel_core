@extends('backend.layouts.main')
@section('title')
Dashboard
@endsection
@section('content')
<style>
    .full-height {
        height: 100vh;
    }

    .flex-center {
        align-items: center;
        display: flex;
        justify-content: center;
    }
</style>
<div class="col-md-6">
    <div>
        {!! $chart->html() !!}
    </div>
</div>
<div class="col-md-6">
    <div>
        {!! $pie->html() !!}
    </div>
</div>
        {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js" charset="utf-8"></script> --}}
{!! Charts::scripts() !!}
{!! $chart->script() !!}
{!! $pie->script() !!}

@include('frontend.layouts.login')    
@endsection