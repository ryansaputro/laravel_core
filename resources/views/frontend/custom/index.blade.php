@extends('frontend.layouts.main')

@section('title')
{{$data->name}}
@endsection
@section('new')
@can('meta-create')
<a href="meta/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: 5px; border-radius: 5px; color: #9cd13a;">
	<i class="fa fa-plus"></i> Tambah
	<p class="hidden-lg hidden-md">Dashboard</p>
</a>
@endcan
@endsection
@section('content')

<div class="col-md-8" style="padding-top:15px;">
	@php
		if($data->pages_type == 'custom'){
			echo $data->custom_html;
		}else{
	@endphp
	<style>
		.view-group {
			display: -ms-flexbox;
			display: flex;
			-ms-flex-direction: row;
			flex-direction: row;
			padding-left: 0;
			margin-bottom: 0;
		}
		.thumbnail
		{
			margin-bottom: 30px;
			padding: 0px;
			-webkit-border-radius: 0px;
			-moz-border-radius: 0px;
			border-radius: 0px;
		}

		.item.list-group-item
		{
			float: none;
			width: 100%;
			background-color: #fff;
			margin-bottom: 30px;
			-ms-flex: 0 0 100%;
			flex: 0 0 100%;
			max-width: 100%;
			padding: 0 1rem;
			border: 0;
		}
		.item.list-group-item .img-event {
			float: left;
			width: 30%;
		}

		.item.list-group-item .list-group-image
		{
			margin-right: 10px;
		}
		.item.list-group-item .thumbnail
		{
			margin-bottom: 0px;
			display: inline-block;
		}
		.item.list-group-item .caption
		{
			float: left;
			width: 100%;
			margin: 0;
		}

		.item.list-group-item:before, .item.list-group-item:after
		{
			display: table;
			content: " ";
		}

		.item.list-group-item:after
		{
			clear: both;
		}
	</style>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 my-3">
				<div class="pull-right">
					<div class="btn-group">
						<button class="btn btn-info" id="list">
							List View
						</button>
						<button class="btn btn-danger" id="grid">
							Grid View
						</button>
					</div>
				</div>
			</div>
		</div> 
		<div id="products" class="row view-group">
			@foreach ($dataQuery as $k => $v)
								<div class="item col-xs-4 col-lg-4">
									<div class="thumbnail card">
										{{-- <div class="img-event">
											<img class="group list-group-image img-fluid" src="http://placehold.it/400x250/000/fff" alt="" />
										</div> --}}
										<div class="caption card-body">
											<h4 class="group card-title inner list-group-item-heading">
												{{$v->name}}</h4>
											<p class="group inner list-group-item-text">
												{{isset($v->description) ? $v->description : ''}}
											</p>
										</div>
									</div>
								</div>
			@endforeach
							</div>
						</div>
	@php
		}
	@endphp
</div>
@endsection

@push('scripts')
<script>
	$(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
        });
</script>
@endpush
