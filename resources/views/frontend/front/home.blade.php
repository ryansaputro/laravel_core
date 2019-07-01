@extends('frontend.layouts.main')
@section('title')
Home
@endsection
 @section('content')
<link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet"> 
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="{{ asset('/css/frontend/style.css') }}" rel="stylesheet">
<style>
	/* Three image containers (use 25% for four, and 50% for two, etc) */
.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}

/* Clear floats after image containers */
.row::after {
  content: "";
  clear: both;
  display: table;
}

.st-btn{
	border: none !important;
}
.st-btn > svg{
	top:-8px !important;
}
.st-btn[data-network='sharethis'] svg{
	fill: #b5b5b5 !important;
}
.st-btn[data-network='facebook'] svg{
	{{-- fill: #b5b5b5 !important; --}}
}
.st-btn[data-network='twitter'] svg{
	{{-- fill: #b5b5b5 !important; --}}
}
.st-btn[data-network='whatsapp'] svg{
	{{-- fill: #b5b5b5 !important; --}}
}

.st-btn[data-network='sharethis']{
	background-color: #fff0 !important;
}
.st-btn[data-network='facebook']{
	background-color: #fff0 !important;

}
.st-btn[data-network='twitter']{
	background-color: #fff0 !important;
}
.st-btn[data-network='whatsapp']{
	background-color: #fff0 !important;
	top:-15px !important;
}
.cardbox .float-right a:hover{
	background-color: #fff0 !important;
}
.st-btn.st-last.st-remove-label{
	display: inline-block !important;
}

.st-total {
	display: none !important;
}
</style>
  <!-- Post Content Column -->
		<div class="col-lg-12">
			<!-- Preview Image -->
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
              @foreach ($banners as $k => $v)
                
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="{{$k == 0 ? 'active' : ''}}"></li>
              @endforeach
            
				</ol>
				<div class="carousel-inner" role="listbox">
					<!-- Slide One - Set the background image for this slide in the line below -->
            @foreach ($banners as $k => $v)
              
					<div class="carousel-item {{$k == 0 ? 'active' : ''}}" style="width:100% !important; background-image: url('{{asset('images/banner/'.$v->data)}}')">
						<div class="carousel-caption d-none d-md-block">
							<h2 class="display-4">{{$v->name}}</h2>
							<p class="lead">@php echo html_entity_decode($v->description, ENT_QUOTES, 'UTF-8'); @endphp.</p>
						</div>
					</div>
            @endforeach
            
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<?php
			$sessLog = !isset(Auth::user()->id) ? 'xxx' : Auth::user()->id;
		?>
		<div class="col-lg-3 hero box-right">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class=" cardbox shadow-lg bg-white">
							<h5 class="card-header">Kategori</h5>
							<div class="card-body trend-topic">
								<ul>
									@foreach ($category as $k => $v)
										<li style="list-style-type: square;"><a href="{{URL::to('/category')}}">{{$v->category}} ({{$v->jumlah}})</a></li>
									@endforeach
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ col-lg-3 -->
		<div class="col-md-6 hero" style="width:100%;">
			<div class="container">
				<div class="row">
          @foreach ($articles as $k => $v)
			@php
				$id_articles = md5($v->id);
				$date = date_create($v->created_at);
			@endphp
			<div class="col-lg-12">
				<div class="cardbox shadow-lg bg-white" id="{{$v->id}}">
					<div class="cardbox-heading">
						<!-- START dropdown-->
						<div class="dropdown float-right button-three">
							<button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
								<em class="fa fa-ellipsis-h"></em>
							</button>
							<div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
								@if($sessLog == $v->created_by) 
									<a class="dropdown-item" href="#">Hide post</a>
								@endif
								<a class="dropdown-item" href="#">Stop following</a>
								<a class="dropdown-item" href="#">Report</a>
							</div>
						</div>
						<!--/ dropdown -->
						<div class="media m-0">
							<div class="d-flex mr-3">
								<a href="">
									<img class="img-fluid rounded-circle" src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/4.jpg" alt="User">
									</a>
								</div>
								<div class="media-body">
									<p class="m-0">{{$v->name}}  <i style="color:#a8a7a6;">di {{$v->category}}</i></p>
									<small>
										<span>
											<i class="icon ion-md-pin"></i> {{date_format($date,"d M Y")}} {{date_format($date,"H:i")}}
										</span>
									</small>
									{{--  <small>
										<span>
											<i class="icon ion-md-time"></i> 10 hours ago
										</span>
									</small>  --}}
								</div>
							</div>
							<!--/ media -->
						</div>
						<!--/ cardbox-heading -->
						<div class="cardbox-item">
							@foreach ($media->where('id_articles', $v->id) as $ke => $ve)
							@php
								$div = count($media->where('id_articles', $v->id));	
							@endphp
							@if($ve->extension == 'jpg' || $ve->extension == 'jpeg' || $ve->extension == 'png' || $ve->extension == 'gif')
								@if ($div == 1)
										<img class="img-fluid" src="{{asset('articles/'.$ve->media)}}" alt="Image">
								@elseif($div == 2)
										<div class="column" style="width:49.3% !important;background-repeat: no-repeat;background-size: contain;background-image:url('{{asset('/articles/'.$ve->media)}}')">
										</div>
								@elseif($div == 3)
										<div class="column" style="width:31.3% !important;background-repeat: no-repeat;background-size: contain;background-image:url('{{asset('/articles/'.$ve->media)}}')">
										</div>
								@endif
							@else
								<video width="100%" controls id="video-id">
									<source src="{{asset('/articles/'.$ve->media)}}" type="video/{{$ve->extension}}">
									Your browser does not support HTML5 video.
								</video>

							@endif
							@endforeach
							@if($v->youtube_link != null)
								<iframe width="100%" height="315" 
										src="{{str_replace('https://youtu.be/', 'https://www.youtube.com/embed/', $v->youtube_link)}}" 
										frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
								</iframe>
							@endif
							</div>
							<div>
								<p style="padding:10px;">{{$v->description}}</p>

							</div>
							<!--/ cardbox-item -->
							<div class="cardbox-base">
								<ul class="float-right">
									<li>
										<a href="#comment-form-{{md5($v->id)}}" {{$sessLog != 'xxx' ? 'onclick=comment("'.$id_articles.'")' : ''}}>
											<i class="fa fa-comments"></i>
										</a>
									</li>
									<li>
										<a href="#comment-form-{{md5($v->id)}}" {{$sessLog != 'xxx' ? 'onclick=comment("'.$id_articles.'")' : ''}}>
											<em class="mr-5 comment_count_{{$v->id}}">{{isset($comment[$v->id]) ? count($comment[$v->id]) : 0}}</em>
										</a>
									</li>
									<li>
										<a class="sharethis-inline-share-buttons" href="#{{$v->id}}">
											<i class="fa fa-share-alt"></i>
										</a>
									</li>
									{{--  <li>
										<a>
											<em class="mr-3">03</em>
										</a>
									</li>  --}}
								</ul>
								<ul>
									<li>
										<a {{$sessLog != 'xxx' ? 'onclick=likes('.$v->id.')' : ''}} style="cursor:cell;">
											<i class="fa fa-thumbs-up like_{{$v->id}}" style="color:{{array_key_exists($v->id, $like) ? '#1869b9' : '#8d8d8d'}}"></i>
										</a>
									</li>

								{{-- <li>
									<a href="#">
										<img src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/3.jpeg" class="img-fluid rounded-circle" alt="User">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/1.jpg" class="img-fluid rounded-circle" alt="User">
											</a>
										</li>
										<li>
											<a href="#">
												<img src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/5.jpg" class="img-fluid rounded-circle" alt="User">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/2.jpg" class="img-fluid rounded-circle" alt="User">
													</a>
											</li> --}}
											<li>
												<a href="#" data-toggle="modal" data-target="#like" class="likeId_{{$v->id}}" onclick="likeShow({{$v->id}})">
													<em class="TotLike_{{$v->id}}">{{(array_key_exists($v->id, $Totlike)) ? $Totlike[$v->id] : 0}} Suka</em>
												</a>
											</li>
										</ul>
									</div>
									<!--/ cardbox-base -->
									@if (isset($comment[$v->id]))
									<div class="cardbox">
										<a href="#comment-list-{{$v->id}}" class="show_comment show_comment_{{$v->id}}" onclick="show_comment({{$v->id}})" style="color:#b5b5b5;padding-left:15px;"><i class="fa fa-angle-right" aria-hidden="true"></i> tampilkan komentar</a>
									</div>
									<div class="comment-box-{{$v->id}}">
										@foreach($comment[$v->id] as $item => $y)
										<div class="comment-wrap comment-list-{{$v->id}}" id="comment-list-{{$v->id}}" style="display: none;"  data-id="hide">
													<div class="photo">
														<div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg')"></div>
													</div>
													<div class="comment-block">
														<p class="m-0" style="color:#1869b9;">{{$y['name']}}</p>
														<p class="comment-text">{{$y['comment']}}</p>
														<div class="bottom-comment">
															<div class="comment-date"><?php echo $y['date'];?></div>
															<ul class="comment-actions">
																<li class="complain">Complain</li>
																<li class="reply">Reply</li>
															</ul>
														</div>
													</div>
												</div>
										@endforeach
										</div>
									@else
									<div class="comment-box-{{$v->id}}"></div>
									@endif


									<!--/ cardbox-like -->
									<div data-id="hide" class="cardbox-comments comment-form-{{md5($v->id)}}"  style="display:none;">
										<span class="comment-avatar float-left">
											<a href="">
												<img class="rounded-circle" src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/6.jpg" alt="...">
												</a>
										</span>
										<div class="search">
											<input placeholder="Write a comment" class="comment_input_{{$v->id}} comment" data-id="{{$v->id}}" type="text" name="comment">
												{{--  <button>
													<i class="fa fa-camera"></i>
												</button>  --}}
										</div>
												<!--/. Search -->
									</div>
									<!--/ cardbox-like -->
								</div>
								<!--/ cardbox -->
							</div>
							<!--/ col-lg-6 -->	
							@endforeach 
						</div>
						<!--/ row -->
					</div>
					<!--/ container -->
				</div>
				<div class="col-lg-3 hero box-right">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class=" cardbox shadow-lg bg-white">
									<h5 class="card-header">Obrolan Hangat</h5>
									<div class="card-body obrolan"></div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class=" cardbox shadow-lg bg-white">
									<h5 class="card-header">Iklan</h5>
									<div class="card-body">
										  <script>
												(adsbygoogle = window.adsbygoogle || []).push({
												google_ad_client: "ca-pub-8588459032506014",
												enable_page_level_ads: true
												});
											</script>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ col-lg-3 -->
				<a href="{{URL::to('/')}}" class="float">
					<i class="fa fa-list my-float" aria-hidden="true"></i>
				</a>
				
<!-- Modal -->
  <div class="modal fade" id="like" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background:#1869b9;color:#fff;">
          <h4 class="modal-title">Orang yang menyukai</h4>
        </div>
        <div class="modal-body">
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
{{-- <div class="sharethis-inline-share-buttons"></div>						 --}}
@include('frontend.layouts.login')    
@endsection
@push('scripts')
<script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=5d1a04f255a8b200110cdf12&product=inline-share-buttons' async='async'></script>
<script>
	function show_comment(a){
		var data = $('#comment-list-'+a).attr('data-id');
		if(data == 'hide'){
			$('.comment-list-'+a).attr('data-id', 'show');
			$('.comment-list-'+a).css('display', '');
			$('.show_comment_'+a).text("> sembunyikan komentar")
		}else{
			$('.comment-list-'+a).attr('data-id', 'hide');
			$('.comment-list-'+a).css('display', 'none');
			$('.show_comment_'+a).text("> tampilkan komentar")
		}
	}

	function comment(a){
		var data = $('.comment-form-'+a).attr('data-id');
		if(data == 'hide'){
			$('.comment-form-'+a).attr('data-id', 'show');
			$('.comment-form-'+a).css('display', '');
		}else{
			$('.comment-form-'+a).attr('data-id', 'hide');
			$('.comment-form-'+a).css('display', 'none');
		}
	}

	$('.comment').keypress(function (e) {
		var data = $(this).val();
		var id = $(this).attr('data-id');
		console.log(id)
		if (e.which == 13) {
			$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				}
			});
			jQuery.ajax({
				url: "{{ url('/articles/comments/') }}",
				method: 'post',
				data: {
					"data": data, 
					"id": id, 
					"_token": "{{ csrf_token() }}",
				},
				success: function(result){
					if(result.status == 200){
						var url = 'https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg';
						var comment = '<div class="comment-wrap comment-list-'+id+'" id="comment-list-'+id+'"  data-id="show">'+
										'<div class="photo">'+
											'<div class="avatar" style="background-image: url('+url+')"></div>'+
										'</div>'+
										'<div class="comment-block">'+
											'<p class="m-0" style="color:#1869b9;">'+result.name+'</p>'+
											'<p class="comment-text">'+result.comment+'</p>'+
											'<div class="bottom-comment">'+
												'<div class="comment-date">baru saja</div>'+
												'<ul class="comment-actions">'+
													'<li class="complain">Complain</li>'+
													'<li class="reply">Reply</li>'+
												'</ul>'+
											'</div>'+
										'</div>'+
									'</div>';

						$('div.comment-box-'+id).append(comment);
						$('.comment_input_'+id).val('');
						$('.comment_count_'+id).html(result.total);
					}
				}
			});
		}
	});

	function likes(a){
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
			}
		});
		jQuery.ajax({
			url: "{{ url('/articles/likes/') }}",
			method: 'post',
			data: {
				"data": a,
				"_token": "{{ csrf_token() }}",
			},
			success: function(result){
				console.log(result)
				if(result.status == 200){
					if(result.data == 1){
						$('.like_'+a).css('color', '#1869b9');
						$('.TotLike_'+a).html(result.like+' Suka');
					}else{
						$('.like_'+a).css('color', '#8d8d8d');
						$('.TotLike_'+a).html(result.like+' Suka');
					}
				}
			}
		});

	}
	function likeShow(a){
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
			}
		});
		jQuery.ajax({
			url: "{{ url('/articles/likeShow/') }}",
			method: 'post',
			data: {
				"data": a,
				"_token": "{{ csrf_token() }}",
			},
			success: function(result){
				console.log(result)
				if(result.status == 200){
						var data = "<ul>";
						if(result.like.length > 0){
							$.each(result.like, function(k,v){
								 data += "<li style='list-style-type: square;'><b style='color: #1869b9;'>"+v.name+"</b><i> pada tanggal "+v.updated_at+"</i></li>";
							})
						}else{
							data += "<li><b>Belum ada orang yang menyukai postingan ini</b></li>"
						}
						 data += "</ul>";
				}else{
					var data = "Gagal memuat";
				}
					$('.modal-body').html(data);
			}
		});

	}
</script>
@endpush
 