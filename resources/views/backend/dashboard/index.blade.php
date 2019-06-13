@extends('backend.layouts.main')
@section('title')
Dashboard
@endsection
@section('content')
<div class="col-md-6">
    <div class="card ">
        <div class="header">
            <h4 class="title">2014 Sales</h4>
            <p class="category">All products including Taxes</p>
        </div>
        <div class="content">
            <div id="chartActivity" class="ct-chart"></div>

            <div class="footer">
                <div class="legend">
                    <i class="fa fa-circle text-info"></i> Tesla Model S
                    <i class="fa fa-circle text-danger"></i> BMW 5 Series
                </div>
                <hr>
                <div class="stats">
                    <i class="fa fa-check"></i> Data information certified
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-6">
    <div class="card ">
        <div class="header">
            <h4 class="title">2014 Sales</h4>
            <p class="category">All products including Taxes</p>
        </div>
        <div class="content">
            <div id="chartActivity" class="ct-chart"></div>

            <div class="footer">
                <div class="legend">
                    <i class="fa fa-circle text-info"></i> Tesla Model S
                    <i class="fa fa-circle text-danger"></i> BMW 5 Series
                </div>
                <hr>
                <div class="stats">
                    <i class="fa fa-check"></i> Data information certified
                </div>
            </div>
        </div>
    </div>
</div>

@include('frontend.layouts.login')    
@endsection