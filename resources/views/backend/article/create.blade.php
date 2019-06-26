@extends('backend.layouts.main')
@section('title')
Tambah Artikel
@endsection
@section('content')
 <style type="text/css">
    input[type=file]{
      display: inline;
    }
    #image_preview{
      border: 2px solid white;
	  padding: 10px;
	  border-radius: 10px;
	  margin-bottom: 20px;
    }
    #image_preview img{
      width: 200px;
      padding: 5px;
	}
	label.upload{
    padding: 10px;
    background: #1dc7ea; 
    display: table;
	color: #fff;
	border-radius: 5px;
	cursor: cell;
     }



input[type="file"] {
    display: none;
}
  </style>
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
	            <a class="btn btn-primary" href="{{ route('article.index') }}"> Back</a>
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
	{!! Form::open(array('route' => 'article.store','method'=>'POST')) !!}
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Judul:</strong>
                {!! Form::text('title', null, array('placeholder' => 'Nama','class' => 'form-control')) !!}
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Kategory:</strong>
                <select name="id_category" class="form-control">
					<option disabled selected>-pilih-</option>
					@foreach ($category as $k => $v)
						<option value="{{$v->id}}">{{$v->name}}</option>
					@endforeach
				</select>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Konten:</strong>
               {!! Form::textarea('description', null,  array('class' => 'form-control')) !!}
            </div>
		</div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
				<label class="upload"><i class="fa fa-file-image-o" aria-hidden="true"></i> Media
					 <input type="file" id="uploadFile" name="uploadFile[]" multiple/>
				</label> 
			</div>
			<div id="image_preview">

			</div>
		</div>
		{{--  <div class="uploader__box js-uploader__box l-center-box  col-xs-12 col-sm-12 col-md-12">
			<div class="uploader__contents">
				<div class="form-group">
					<label class="button button--secondary" for="fileinput">Select Files</label>
					<input id="fileinput" class="uploader__file-input" type="file" multiple value="Select Files">
				</div>
			</div>
		</div>  --}}
		

		<div class="col-xs-12 col-sm-12 col-md-12 text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
        </div>

	</div>
	{!! Form::close() !!}
	<link href="{{ asset('/css/backend/texteditor/summernote.css') }}" rel="stylesheet">
	<link href="{{ asset('/css/backend/uploadimage/styles.imageuploader.css') }}" rel="stylesheet">
@endsection

@push('scripts')
<!-- include libraries(jQuery, bootstrap) -->
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/jquery.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/bootstrap.min.js') }}"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
<script type="text/javascript">
  

  $("#uploadFile").change(function(){
     $('#image_preview').html("");
     var total_file=document.getElementById("uploadFile").files.length;
	 
     for(var i=0;i<total_file;i++)
     {
		var id = event.target.files[i].name;
		var nameID = id.split('-').join('_');
		var nameIDX = id.split(' ').join('_');
	  //$('#image_preview').append("<img id='"+i+"' src='"+URL.createObjectURL(event.target.files[i])+"'>");
	  
		var file = event.target.files[i];
		var fileReader = new FileReader();
		if (file.type.match('image')) {
			fileReader.onload = function() {
			var img = document.createElement('img');
			img.src = fileReader.result;
			$('#image_preview').append(img)
			//document.getElementsById('image_preview')[0].appendChild(img);
			document.getElementsByTagName('div')[0].appendChild(img);
			};
			fileReader.readAsDataURL(file);
		} else {
			fileReader.onload = function() {
			var blob = new Blob([fileReader.result], {type: file.type});
			var url = URL.createObjectURL(blob);
			var video = document.createElement('video');
			var timeupdate = function() {
				if (snapImage()) {
				video.removeEventListener('timeupdate', timeupdate);
				video.pause();
				}
			};
			video.addEventListener('loadeddata', function() {
				if (snapImage()) {
				video.removeEventListener('timeupdate', timeupdate);
				}
			});
			var snapImage = function() {
				var canvas = document.createElement('canvas');
				canvas.width = video.videoWidth;
				canvas.height = video.videoHeight;
				canvas.getContext('2d').drawImage(video, 0, 0, canvas.width, canvas.height);
				var image = canvas.toDataURL();
				var success = image.length > 100000;
				if (success) {
				var img = document.createElement('img');
				img.src = image;
				document.getElementsByTagName('div')[0].appendChild(img);
				URL.revokeObjectURL(url);
				}
				return success;
			};
			video.addEventListener('timeupdate', timeupdate);
			video.preload = 'metadata';
			video.src = url;
			// Load video in Safari / IE11
			video.muted = true;
			video.playsInline = true;
			video.play();
			};
			fileReader.readAsArrayBuffer(file);
		}
     }


  });

  $('form').ajaxForm(function() 
   {
    alert("Uploaded SuccessFully");
   }); 


</script>

@endpush