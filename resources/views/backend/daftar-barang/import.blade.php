@extends('backend.layouts.main')
@section('title')
Import  Barang
@endsection
@section('content')
<style>
	
.custom-file-input::-webkit-file-upload-button {
  visibility: hidden;
}
.custom-file-input::before {
  content: 'unggah (.xls)';
  display: inline-block;
  background: linear-gradient(top, #f9f9f9, #e3e3e3);
  border: 1px solid #999;
  border-radius: 3px;
  padding: 5px 8px;
  outline: none;
  white-space: nowrap;
  -webkit-user-select: none;
  cursor: pointer;
  text-shadow: 1px 1px #fff;
  font-weight: 700;
  font-size: 10pt;
  color: black;
}
.custom-file-input:hover::before {
  border-color: black;
}
.custom-file-input:active::before {
  background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9);
}
</style>
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
<form action="{{ route('daftar_barang.importStore') }}" class="myform" method="post" enctype="multipart/form-data">
	@csrf
	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif
	<div class="alert alert-info">
		<strong>Info!</strong> Format harus berekstensi (.xls) atau (.xlsx).
	</div>

	<div class="form-group  col-md-12">
		<p style="position: absolute;margin-top:0px;">Telusuri komputer Anda: </p><input type="file" required style="margin-left: 200px;" name="import_file" class=""> <p  style="position: absolute;margin-top: -22px;margin-left: 450px;">(Batas ukuran: 2 Mb)</p>
	</div>
	<div class="col-lg-12 margin-tb">
		<div class="pull-left">
			<a class="btn btn-primary" href="{{ route('daftar_barang.index') }}"> Batalkan</a>
			<button type="submit" class="btn btn-primary submit">Simpan</button>
		</div>
	</div>

	<div class="form-group  col-md-12">
		<p>Usahakan ketika sedang mengupload tidak keluar dari halaman agar barang terupload dengan sempurna.</p>
	</div>
</form>
@endsection

@push('scripts')
{{--  <script type="text/javascript" src="{{ asset('/js/backend/texteditor/jquery.min.js') }}"></script>   --}}
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

	var id = "";
	function changeImage(a){
		{{--  RecurFadeIn();  --}}
		id = $(a).attr('data-id'); 
		readURL(a, id);   
	}


	function readURL(input, id) {
		console.log(input)
		console.log(reader)
	if (input.files && input.files[0]) {   
		var reader = new FileReader();
		var filename = $("#inputGroupFile0"+id).val();
		filename = filename.substring(filename.lastIndexOf('\\')+1);
		reader.onload = function(e) {
		{{--  debugger;        --}}
		{{--  $('#img_contain'+id).attr('background-image', 'url('+e.target.result+')');  --}}
		$('#img_contain'+id).css('background-image', 'url(' + e.target.result + ')');
		$('#img_contain'+id).hide();
		$('#img_contain'+id).fadeIn(500);      
		$('.custom-file-label-'+id).text(filename);             
		}
		reader.readAsDataURL(input.files[0]);    
	} 
	$(".alert").removeClass("loading").hide();
	}
	{{--  function RecurFadeIn(){ 
	console.log('ran');
	FadeInAlert("Wait for it...");  
	}  --}}
	function FadeInAlert(text){
	$(".alert").show();
	$(".alert").text(text).addClass("loading");  
	}
	
</script>
@endpush