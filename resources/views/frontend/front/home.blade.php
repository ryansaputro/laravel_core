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
		<div class="col-lg-3 hero">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class=" cardbox shadow-lg bg-white">
							<h5 class="card-header">Trending Topik</h5>
							<div class="card-body trend-topic"></div>
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
                        $date = date_create($v->created_at);
                    @endphp
					<div class="col-lg-12">
						<div class="cardbox shadow-lg bg-white">
							<div class="cardbox-heading">
								<!-- START dropdown-->
								<div class="dropdown float-right">
									<button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
										<em class="fa fa-ellipsis-h"></em>
									</button>
									<div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
										<a class="dropdown-item" href="#">Hide post</a>
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
											<p class="m-0">{{$v->name}}</p>
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
												<div class="column" style="width:49.3% !important;height: 300px;background-repeat: no-repeat;background-size: contain;background-image:url('{{asset('/articles/'.$ve->media)}}')">
												</div>
										@elseif($div == 3)
												<div class="column" style="height: 300px;background-repeat: no-repeat;background-size: contain;background-image:url('{{asset('/articles/'.$ve->media)}}')">
												</div>
										@endif
									@else
										<video width="100%" controls id="video-id">
											<source src="{{asset('/articles/'.$ve->media)}}" type="video/{{$ve->extension}}">
											Your browser does not support HTML5 video.
										</video>

									@endif
									@endforeach
									</div>
									<div>
										<p style="padding:10px;">{{$v->description}}</p>

									</div>
									<!--/ cardbox-item -->
									<div class="cardbox-base">
										<ul class="float-right">
											<li>
												<a>
													<i class="fa fa-comments"></i>
												</a>
											</li>
											<li>
												<a>
													<em class="mr-5">12</em>
												</a>
											</li>
											<li>
												<a>
													<i class="fa fa-share-alt"></i>
												</a>
											</li>
											<li>
												<a>
													<em class="mr-3">03</em>
												</a>
											</li>
										</ul>
										<ul>
											<li>
												<a>
													<i class="fa fa-thumbs-up"></i>
												</a>
											</li>
											<li>
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
															</li>
															<li>
																<a>
																	<span>242 Likes</span>
																</a>
															</li>
														</ul>
													</div>
													<!--/ cardbox-base -->
													<div class="cardbox-comments">
														<span class="comment-avatar float-left">
															<a href="">
																<img class="rounded-circle" src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/6.jpg" alt="...">
																</a>
															</span>
															<div class="search">
																<input placeholder="Write a comment" type="text">
																	<button>
																		<i class="fa fa-camera"></i>
																	</button>
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
															<div class="card-body"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--/ col-lg-3 -->
										<a href="https://api.whatsapp.com/send?phone=51955081075&text=Hola%21%20Quisiera%20m%C3%A1s%20informaci%C3%B3n%20sobre%20Varela%202." class="float" target="_blank">
											<i class="fa fa-commenting my-float" aria-hidden="true"></i>
										</a>

@include('frontend.layouts.login')    
 @endsection
 @push('scripts')
 <script>
 </script>
@endpush
 