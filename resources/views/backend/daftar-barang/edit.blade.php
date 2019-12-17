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
	{{-- {{ route('daftar_barang.update', ['id_barang' => md5($barang->id_barang)]) }} --}}
<form action="" class="myform" method="post" enctype="multipart/form-data">
	<input type="hidden" name="_method" value="PUT">
	@csrf

	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif

	<div class="form-group col-xs-3 col-md-3">
        <label for="kode_barang" class="control-label">Kode Barang</label>
        <input type="text" class="form-control" id="kode_barang" value="{{$barang->kode_barang}}" required name="kode_barang">
    </div>
	<div class="form-group col-xs-3 col-md-3">
        <label for="nama_barang" class="control-label">Nama Barang</label>
        <input type="text" value='{{$barang->nama_barang}}' class="form-control" id="nama_barang" required name="nama_barang">
    </div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_satuan" class="control-label">Satuan</label>
			<select data-live-search="true" class="form-control" id="id_satuan" required name="id_satuan">
				<option disabled>-pilih satuan-</option>
				@foreach($satuan AS $k => $v)
				<option {{$barang->id_satuan == $v->id_satuan ? 'selected' : ''}} value="{{$v->id_satuan}}">{{$v->nama_satuan}}({{$v->kode_satuan}})</option>
				@endforeach
			</select>
	</div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_golongan_barang" class="control-label">Golongan</label>
			<select data-live-search="true" class="form-control" id="id_golongan_barang" required name="id_golongan_barang">
				<option disabled>-pilih golongan-</option>
				@foreach($golongan AS $k => $v)
				<option {{$barang->id_golongan_barang == $v->id_golongan_barang ? 'selected' : ''}} value="{{$v->id_golongan_barang}}">{{$v->nama_golongan}}({{$v->kode_golongan}})</option>
				@endforeach
			</select>
	</div>
	<div class="form-group col-xs-3 col-md-3">
        <label for="stock_minimal" class="control-label">Stok Minimal</label>
        <input type="number" value='{{$barang->stock_minimal}}' class="form-control" id="stock_minimal" required name="stock_minimal">
    </div>
	<div class="vl"></div>
    <div class="form-group col-xs-3 col-md-3">
		<label for="dibuat_oleh" class="control-label">Dibuat Oleh</label>
        <input type="text" value='{{$barang->name}}' readonly class="form-control" id="dibuat_oleh_receive" placeholder="dibuat_oleh">
    </div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="id_jenis_barang" class="control-label">Jenis Barang</label>
			<select data-live-search="true" class="form-control" id="id_jenis_barang" required name="id_jenis_barang">
				<option disabled selected>-pilih jenis barang-</option>
				@foreach($jenis AS $k => $v)
				<option {{$barang->id_jenis_barang == $v->id_jenis_barang ? 'selected' : ''}} value="{{$v->id_jenis_barang}}">{{$v->nama_jenis_barang}}({{$v->kode_jenis_barang}})</option>
				@endforeach
			</select>
	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="status" class="control-label">Status</label>
			<select data-live-search="true" class="form-control" id="status" required name="status">
				<option disabled selected>-pilih status-</option>
				<option {{$barang->status == '1' ? 'selected' : ''}} value="1">Aktif</option>
				<option {{$barang->status == '0' ? 'selected' : ''}} value="0">Tidak AKtif</option>
			</select>

	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="status" class="control-label">Deskripsi</label>
		<textarea class="form-control" id="deskripsi" name="deskripsi">{{$barang->deskripsi}}</textarea>
	</div>

	<div class="form-group col-xs-12 col-md-12">
		@for($i=1; $i<=3; $i++)
		<div class="form-group col-xs-4 col-md-4">
			<div class="img_contain" id='img_contain{{$i}}' style="background-image:url({{isset($foto[$i-1]->image) ? asset('images/list-barang/'.$foto[$i-1]->image) : 'https://image.flaticon.com/icons/png/512/994/994920.png'}})"></div>
			<div class="input-group">
				<div class="custom-file">
					<input type="file" id="inputGroupFile0{{$i}}" name="image[{{$i}}]" onchange="changeImage(this)" data-id="{{$i}}" class="upload-image imgInp custom-file-input" aria-describedby="inputGroupFileAddon0{{$i}}">
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
{{-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> --}}
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

	var id = "";
	function changeImage(a){
		id = $(a).attr('data-id'); 
		readURL(a, id);   
	}


	function readURL(input, id) {
	if (input.files && input.files[0]) {   
		var reader = new FileReader();
		var filename = $("#inputGroupFile0"+id).val();
		filename = filename.substring(filename.lastIndexOf('\\')+1);
		reader.onload = function(e) {
		$('#img_contain'+id).css('background-image', 'url(' + e.target.result + ')');
		$('#img_contain'+id).hide();
		$('#img_contain'+id).fadeIn(500);      
		$('.custom-file-label-'+id).text(filename);             
		}
		reader.readAsDataURL(input.files[0]);    
	} 
	$(".alert").removeClass("loading").hide();
	}
	
	function FadeInAlert(text){
	$(".alert").show();
	$(".alert").text(text).addClass("loading");  
	}
	

	function gantiFoto(e){
		alert("hai")
		
	}

	$('#inputGroupFile01').on('input change', function(){
		alert('has change');
		$('.myform').attr('action', '{{URL::to("administrator/daftar_barang/ajaxBarangUpdateFoto")}}');
		var formData = new FormData($('form')[2]);
			console.log(formData)
			$.ajax({
			url:"{{URL::to('administrator/daftar_barang/ajaxBarangUpdateFoto')}}",
			method:"POST",
			data:formData,
			dataType:'JSON',
			contentType: false,
			cache: false,
			processData: false,
			success:function(data)
			{
				console.log(data)
			}
			})

	})

	    {{--  $("input[type=file]").change(function(e){
			e.preventDefault();    
			var formData = new FormData(this);
		
			$.ajax({
				url: "{{URL::to('administrator/daftar_barang/ajaxBarangUpdateFoto')}}",
				type: 'POST',
				data: formData,
				success: function (data) {
					alert(data)
				},
				cache: false,
				contentType: false,
				processData: false
			});
			
			$('.upload-image').on('input', function(){
				alert("diganti foto")
			});

		});  --}}

		{{--  $(document).ready(function(){
			
			$('.myform').on('submit', function(event){
			event.preventDefault();
			var formData = new FormData($('form')[2]);
			console.log(formData)
			$.ajax({
			url:"{{URL::to('administrator/daftar_barang/ajaxBarangUpdateFoto')}}",
			method:"POST",
			data:formData,
			dataType:'JSON',
			contentType: false,
			cache: false,
			processData: false,
			success:function(data)
			{
				console.log(data)
			}
			})
			});

		});  --}}
</script>
@endpush