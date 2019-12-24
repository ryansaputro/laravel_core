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

	.form-group {
		width: 15%;
		position: absolute;
	}

	.content {
		width: 100%;
		overflow-x: auto;
		white-space: nowrap;
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
<form action="{{ route('barang_vendor.store') }}" class="myform" method="post" enctype="multipart/form-data">
	@csrf
	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif
{{--  `id_barang`, `id_vendor`, `id_satuan`, `qty`, `harga_beli`, `harga_jual`, `tanggal_kadaluarsa`, `dibuat_oleh`, `created_at`, `updated_at`, `no_batch`  --}}
<table class="table mdl-data-table">
	<thead>
		<tr>
			<th>Barang</th>
			<th>Vendor</th>
			<th>Satuan</th>
			<th>Qty</th>
			<th>Harga Beli</th>
			<th>Harga Jual</th>
			<th>Status</th>
			<th>Aksi</th>
		</tr>
	</thead>
	<tbody>
		<tr class="tr_clone" data-id="1">
			<td>
			<select data-live-search="true" class="form-control" id="id_barang" required name="id_barang[]">
				<option disabled selected>-pilih barang-</option>
				@foreach($barang AS $k => $v)
				<option value="{{$v->id_barang}}">{{$v->nama_barang}} ({{$v->kode_barang}})</option>
				@endforeach
			</select>
			</td>
			<td>
				<select data-live-search="true" class="form-control" id="id_vendor" required name="id_vendor[]">
					<option disabled selected>-pilih vendor-</option>
					@foreach($vendor AS $k => $v)
					<option value="{{$v->id_vendor}}">{{$v->nama_vendor}}</option>
					@endforeach
				</select>
			</td>
			<td>
				<select data-live-search="true" class="form-control" id="id_satuan" required name="id_satuan[]">
					<option disabled selected>-pilih satuan-</option>
					@foreach($satuan AS $k => $v)
					<option value="{{$v->id_satuan}}">{{$v->nama_satuan}}({{$v->kode_satuan}})</option>
					@endforeach
				</select>
			</td>
			<td>
				<input type="number" value='' class="form-control" id="qty" required name="qty[]">
			</td>
			<td>
				<input type="number" value='' class="form-control" id="harga_beli" required name="harga_beli[]">
			</td>
			<td>
				<input type="number" value='' class="form-control" id="harga_jual" required name="harga_jual[]">
			</td>
			<td>
				<select class="form-control" id="status" required name="status[]">
					<option value="1">Aktif</option>
					<option value="0">Tidak Aktif</option>
				</select>
			</td>
			{{--  <td>
				<input type="number" value='' class="form-control" id="tanggal_kadaluarsa" required name="tanggal_kadaluarsa[]">
			</td>  --}}
			<td class="aksi">
				
			</td>
		</tr>
	</tbody>
</table>
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
				<a class="btn btn-warning tr_clone_add">Tambah Daftar</a>
				<a class="btn btn-danger" href="{{ route('daftar_barang.index') }}"> Batalkan</a>
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

	function vendorSelect(a){
		{{--  $(a).attr('readonly', 'readonly');  --}}
		{{--  $(a).attr('disabled', true);  --}}
	}

	function ChangeVendor(a){
		$('#id_barang').prop('selectedIndex',0);
		$('#qty').val('0');
		$('#harga').val('0');
		$('#id_satuan').val('-');
		$('.AddItemtoList').css('display', 'none');
		idBrg = [];
		$('#id_vendor').prop('selectedIndex',0);
		$('.allItem tr').remove();
		$('#id_vendor').removeAttr('readonly');
		{{--  $('#id_vendor').attr('disabled', false);  --}}
	}	

	$(".tr_clone_add").on('click', function() {
		var getId = $('.tr_clone').last().attr('data-id');
		var no = parseInt(getId)+1;
		var $tr    = $('.tr_clone').last();
		var $clone = $tr.clone().attr('data-id',no).attr('id', 'tr_'+no).attr('value', '');
		var aksi = '<a class="btn btn-danger btn-sm hapus" data-id="'+no+'" onclick="hapusRow(this)">Hapus</a>';
		$tr.after($clone);
		$('.tr_clone').last().find('td.aksi').html(aksi);
	});

	$(document).ready(function(){
		if($('.tr_clone').last().find('td.no').text() == '1'){
			$('.tr_clone').last().find('td.aksi').html("-");
		}

	});

	function hapusRow(a){
		var id = $(a).attr('data-id');
		$('#tr_'+id).remove();
	}
</script>
@endpush