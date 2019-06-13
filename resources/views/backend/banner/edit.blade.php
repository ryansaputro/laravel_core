@extends('backend.layouts.main')
@section('title')
Sunting Meta
@endsection
@section('content')
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
	            <a class="btn btn-primary" href="{{ route('banner.index') }}"> Back</a>
	        </div>
	    </div>
	</div>
	@if (count($errors) > 0)
		<div class="alert alert-danger">
			<strong>Whoops!</strong> There were some problems with your input.<br><br>
			<ul>
				@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
				@endforeach
			</ul>
		</div>
	@endif
	{!! Form::model($banner, ['method' => 'PATCH', 'enctype' => 'multipart/form-data', 'route' => ['banner.update', $banner->id]]) !!}
	<div class="col-xs-12 col-sm-12 col-md-12">
		<div class="form-group">
			<strong>Pilih Gambar:</strong>
			<div class="col-md-12">
				<input type="file" name="image" id="inputFile" value="{{$banner->data}}">
			</div>
			<div class="col-md-12 image_upload_preview" style="background-repeat: no-repeat;background-position: center;height:200px; width:100%;background-image:url('{{asset('images/banner/'.$banner->data)}}'); background-size:cover; background-repeat:no-repeat;">
				{{--  <img id="image_upload_preview" src="http://placehold.it/100x100" alt="your image" />  --}}
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12">
		<div class="form-group">
			<strong>Name:</strong>
			{!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12">
		<div class="form-group">
			<strong>Description:</strong>
			{!! Form::textarea('description', null,  array('class' => 'summernote')) !!}
		</div>
	</div>

	<div class="col-xs-12 col-sm-12 col-md-12 text-center">
			<button type="submit" class="btn btn-primary">Submit</button>
	</div>
    {!! Form::close() !!}
<link href="{{ asset('/css/backend/texteditor/summernote.css') }}" rel="stylesheet">
@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/jquery.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/bootstrap.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/summernote.js') }}"></script> 
<script type="text/javascript">
    $(document).ready(function() {
      $('.summernote').summernote({
        height: 300,
        tabsize: 2
      });
	});

	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
				{{--  $('#image_upload_preview').attr('src', e.target.result);  --}}
				$('.image_upload_preview').css('background-image', 'url(' +  e.target.result + ')');
				
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#inputFile").change(function () {
        readURL(this);
    });	

  </script>

@endpush