@extends('backend.layouts.main')
@section('title')
Buat Daftar Barang
@endsection
@section('content')
<style>
	label {
		color: #9a9a9a;
	}
	.vl {
	border-left: 2px solid #ccc;
	height: 250px;
	position: absolute;
    margin-left: 48.3%;
	}


	#blah{  
	max-height:256px;
	height:auto;
	width:auto;
	display:block;
	margin-left: auto;
	margin-right: auto;
	padding:5px;
	}
	{{--  #img_contain{
	border-radius:5px;
	/*  border:1px solid grey;*/
	margin-top:20px;
	width:auto;  
	}  --}}
	{{--  .input-group{  
	margin-left:40px;
	}  --}}
	.img_contain{
	background-size: contain;
    height: 250px;
    background-repeat: no-repeat;
    background-position: center;
	}
	.imgInp{  
	width:150px;
	margin-top:10px;
	padding:10px;
	background-color:#d3d3d3;  
	}
	.loading{
	animation:blinkingText ease 2.5s infinite;
	}
	@keyframes blinkingText{
		0%{     color: #000;    }     
		50%{   color: #transparent; }
		99%{    color:transparent;  }
		100%{ color:#000; }
	}
	.custom-file-label{
	cursor:pointer;
	}

	.custom-file-input {
		position: relative;
		z-index: 2;
		width: 100%;
		height: calc(2.25rem + 2px);
		margin: 0;
		opacity: 0;
	}

	.custom-file-label {
		position: absolute;
		top: 0;
		right: 0;
		left: 0;
		z-index: 1;
		height: calc(2.25rem + 2px);
		padding: .375rem .75rem;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		border: 1px solid #ced4da;
		border-radius: .25rem;
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
<form action="{{ route('daftar_barang.store') }}" class="myform" method="post" enctype="multipart/form-data">
	@csrf
	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif

	<div class="form-group col-xs-3 col-md-3">
        <label for="kode_barang" class="control-label">Kode Barang</label>
        <input type="text" value='' class="form-control" id="kode_barang" required name="kode_barang">
    </div>
	<div class="form-group col-xs-3 col-md-3">
        <label for="nama_barang" class="control-label">Nama Barang</label>
        <input type="text" value='' class="form-control" id="nama_barang" required name="nama_barang">
    </div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_satuan" class="control-label">Satuan</label>
			<select data-live-search="true" class="form-control" id="id_satuan" required name="id_satuan">
				<option disabled selected>-pilih satuan-</option>
				@foreach($satuan AS $k => $v)
				<option value="{{$v->id_satuan}}">{{$v->nama_satuan}}({{$v->kode_satuan}})</option>
				@endforeach
			</select>
	</div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_golongan_barang" class="control-label">Golongan</label>
			<select data-live-search="true" class="form-control" id="id_golongan_barang" required name="id_golongan_barang">
				<option disabled selected>-pilih golongan-</option>
				@foreach($golongan AS $k => $v)
				<option value="{{$v->id_golongan_barang}}">{{$v->nama_golongan}}({{$v->kode_golongan}})</option>
				@endforeach
			</select>
	</div>
	<div class="form-group col-xs-3 col-md-3">
        <label for="stock_minimal" class="control-label">Stok Minimal</label>
        <input type="number" value='' class="form-control" id="stock_minimal" required name="stock_minimal">
    </div>
	<div class="vl"></div>
    <div class="form-group col-xs-3 col-md-3">
		<label for="dibuat_oleh" class="control-label">Dibuat Oleh</label>
        <input type="text" value='{{Auth::user()->name}}' readonly class="form-control" id="dibuat_oleh_receive" placeholder="dibuat_oleh">
    </div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="id_jenis_barang" class="control-label">Jenis Barang</label>
			<select data-live-search="true" class="form-control" id="id_jenis_barang" required name="id_jenis_barang">
				<option disabled selected>-pilih jenis barang-</option>
				@foreach($jenis AS $k => $v)
				<option value="{{$v->id_jenis_barang}}">{{$v->nama_jenis_barang}}({{$v->kode_jenis_barang}})</option>
				@endforeach
			</select>
	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="status" class="control-label">Status</label>
			<select data-live-search="true" class="form-control" id="status" required name="status">
				<option disabled selected>-pilih status-</option>
				<option value="1">Aktif</option>
				<option value="0">Tidak AKtif</option>
			</select>

	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="status" class="control-label">Deskripsi</label>
		<textarea class="form-control" id="deskripsi" name="deskripsi"></textarea>
	</div>

	<div class="form-group col-xs-12 col-md-12">
		@for($i=1; $i<=3; $i++)
		<div class="form-group col-xs-4 col-md-4">
			<div class="img_contain" id='img_contain{{$i}}' style="background-image:url('https://image.flaticon.com/icons/png/512/994/994920.png')"></div>
			<div class="input-group">
				<div class="custom-file">
					<input type="file" id="inputGroupFile0{{$i}}" name="image[]" onchange="changeImage(this)" data-id="{{$i}}" class="imgInp custom-file-input" aria-describedby="inputGroupFileAddon0{{$i}}">
					<label class="custom-file-label-{{$i}}" for="inputGroupFile0{{$i}}">unggah foto</label>
				</div>
			</div>
		</div>
		@endfor
	</div>
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
				<a class="btn btn-primary" href="{{ route('daftar_barang.index') }}"> Batalkan</a>
				<button type="submit" class="btn btn-primary submit">Simpan</button>
	        </div>
	    </div>
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