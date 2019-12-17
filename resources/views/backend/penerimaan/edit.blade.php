@extends('backend.layouts.main')
@section('title')
Buat Pesanan
@endsection
@section('content')
<style>
	label {
		color: #9a9a9a;
	}
	.vl {
	border-left: 2px solid #ccc;
	height: 308px;
	position: absolute;
    margin-left: 48.3%;
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
<div class="alert alert-info">
  <strong>Info!</strong> Sekali pemesanan hanya dapat dilakukan oleh satu vendor. Jika ingin mengganti vendor dapat mengklik <i class="fa fa-refresh" aria-hidden="true"></i> dan barang yang ada di list akan otomatis terhapus.
</div>
<form action="{{ route('pemesanan.update', ['id' => md5($data->id_pemesanan)]) }}" class="myform" method="post" enctype="multipart/form-data">
	 <input type="hidden" name="_method" value="PUT">
	@csrf
	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif
	@php
		$datetime = $data->dibuat_tgl;
		$dt = strtotime($datetime);
		$tgl =  date("Y-m-d", $dt);	
	@endphp
	<div class="form-group col-xs-3 col-md-3">
        <label for="no_pemesanan" class="control-label">No Pemesanan</label>
        <input type="text" value='{{$data->no_pemesanan}}' class="form-control" readonly required>
    </div>
	<div class="form-group col-xs-3 col-md-3">
        <label for="no_pemesanan" class="control-label">No Revisi Pemesanan</label>
        <input type="text" value='{{$no_pemesanan}}' class="form-control" id="no_pemesanan" required name="no_pemesanan">
    </div>
    
	<div class="vl"></div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_vendor" class="control-label">Vendor</label>
		<div class="input-group">
			<select data-live-search="true" class="form-control" id="id_vendor" required name="id_vendor" onchange="vendorSelect(this)">
				<option disabled selected>-pilih vendor-</option>
				@foreach($vendor AS $k => $v)
				<option {{$data->id_vendor == $v->id_vendor ? 'selected' : ''}} value="{{$v->id_vendor}}">{{$v->nama_vendor}}</option>
				@endforeach
			</select>
			<span class="input-group-addon" ddata-toggle="tooltip" data-placement="right" title="klik untuk mengganti vendor" style="border-left: 1px solid #ddd;"><a class="refresh" style="color:red;" href="#id_vendor" onclick="ChangeVendor(this)"><i class="fa fa-refresh" aria-hidden="true"></i></a></span>
		</div>
    </div>
    <div class="form-group col-xs-3 col-md-3">
        <label for="id_barang" class="control-label">Nama Barang</label>
		<select data-live-search="true" class="form-control" id="id_barang" onchange="BarangSelect(this)" name="id_barang">
			<option disabled selected>-pilih barang-</option>
			@foreach($listItem AS $k => $v)
				<option value="{{$v->id_barang}}">{{$v->nama_barang}}</option>
			@endforeach
		</select>

	</div>
	<div class="form-group col-xs-3 col-md-3" >
        <label for="dibuat_tgl" class="control-label">Tanggal Pemesanan</label>
        <input type="date" value="{{$tgl}}" class="form-control" id="dibuat_tgl" required name="dibuat_tgl">
	</div>
    <div class="form-group col-xs-3 col-md-3">
		<label for="dibuat_oleh" class="control-label">Dibuat Oleh</label>
        <input type="text" value='{{$data->name}}' readonly class="form-control" id="dibuat_oleh" placeholder="dibuat_oleh">
    </div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="qty" class="control-label">Jumlah Pemesanan</label>
		<input type="number" value='0' class="form-control" id="qty" name="qty">
	</div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_satuan" class="control-label">Satuan</label>
		<input type="text" value='-' readonly class="form-control" id="id_satuan" placeholder="id_satuan">
	</div>
	{{--  <div class="form-group col-xs-6 col-md-6">
		<label for="name" class="control-label">Status</label>
		<select class="form-control" id="status" required name="status">
			<option disabled>-pilih status-</option>
			<option {{$data->status == '1' ? 'selected' : ''}} value="1">sukses</option>
			<option {{$data->status == '6' ? 'selected' : ''}} value="6">draft</option>
		</select>
	</div>  --}}
	<div class="form-group col-xs-6 col-md-6" style="float:left;">
		<label for="catatan" class="control-label">Catatan</label>
		<input type="text" value='{{$data->catatan}}' class="form-control" id="catatan" required name="catatan">
	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="harga" class="control-label">Harga</label>
		<div class="input-group">
			<input type="number" readonly value='' class="form-control" id="harga" placeholder="harga">
			<span class="input-group-addon" ddata-toggle="tooltip" data-placement="right" title="klik untuk merubah harga" style="border-left: 1px solid #ddd;"><a class="rubahHarga" style="color:red;" href="#harga"  onclick="changeHarga(this)"><i class="fa fa-pencil" aria-hidden="true"></i></a></span>
		</div>
	</div>
	<div class="form-group col-xs-6 col-md-6" style="float:right;">
		<a class="btn btn-primary btn-block AddItemtoList" onclick="AddItemtoList(this)">Masukkan ke daftar barang</a>
	</div>
	<div class="form-group col-xs-12 col-md-12" style="margin-top:50px;">
		<label for="name" class="control-label">Daftar Barang</label>
		<table class="table table-stripped listItem">
			<thead>
				<tr>
					<th>Nama</th>
					<th width="20%">Jumlah</th>
					<th>Satuan</th>
					<th>Harga</th>
					<th width="20%">Catatan</th>
					<th>Aksi</th>
				</tr>
			</thead>
			<tbody class="allItem">
				@php
					$id = '';	
					$arr = array();	
				@endphp
				@foreach ($item as $k => $v)
				@php
					$arr[$k] = strval($v->id_barang);
					if($id){ $id.=',';}
					$id .= $v->id_barang;
				@endphp
					<tr id="tr_{{$v->id_barang}}">
						<td>{{$v->nama_barang}}
							<input type="hidden" value="{{$v->id_barang}}" class="form-control" id="id_barang" name="id_barang[]">
						</td>
						<td style="width:30%;">
							<input type="number" value="{{$v->qty}}" class="form-control" id="qty" data-id="{{$v->id_barang}}" onclick="qtyClick(this)" oninput="qtyChange(this)" name="qty[]">
						</td>
						<td>{{$v->nama_satuan}}</td>
						<td>
							Rp. {{number_format($v->harga, 0, '.', '.')}}
							<input type="hidden" value="{{$v->harga}}" id="harga" class="form-control" id="qty" data-id="{{$v->id_barang}}" name="harga[]">
						</td>
						<td style="width:30%;">
							<input type="text" value="{{$v->keterangan}}" placeholder="masukkan catatan untuk barang ini" class="form-control" id="catatan" name="keterangan[]">
						</td>
						<td><a href="#" onclick="delItem(this)"  data-id="{{$v->id_barang}}">Hapus</a></td>
					</tr>	
				@endforeach
			</tbody>
		</table>
		@php
		$arrData = json_encode($arr);
		@endphp
	</div>
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
				<a class="btn btn-primary" href="{{ route('pemesanan.index') }}"> Batalkan</a>
				<button type="submit" class="btn btn-primary submit" style="display:none;">Revisi</button>
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
	function changeHarga(a){
		$('#harga').removeAttr('readonly');
	}


	var $j = jQuery.noConflict();
	$('.refresh').on('mouseover', function(){
		$j('[data-toggle="popover"]').popover(); 
		console.log("hover me")  
	});

	$(document).ready(function(){
		$('.AddItemtoList').css('display', 'none');
		$('#id_vendor').attr('disabled', 'disabled');
		$('#id_vendor').attr('readonly');
	});
   
	function vendorSelect(a){
		var oldVendor = "{{$data->id_vendor}}";
		var newVendor = $(a).val();

		if(oldVendor == newVendor){
			$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				}
			});
			jQuery.ajax({
				url: "{{ url('/administrator/pemesanan/ajaxBarangRevItem') }}",
				method: 'post',
				data: {
					"data": $(a).val(),
					"id_vendor": "{{$data->id_vendor}}",
					"id_pemesanan": "{{$data->id_pemesanan}}",
					"_token": "{{ csrf_token() }}",
				},
				success: function(result){
					if(result.status == 200){
						console.log(result.data)
						var html = "";
						$.each(result.data, function(k,v){
							html += '<tr id="tr_'+v.id_vendor+'"><td>'+v.nama_barang+'<input type="hidden" value="'+v.id_barang+'" class="form-control" id="id_barang" name="id_barang[]"></td><td style="width:30%;"><input type="number" value="'+v.qty+'" class="form-control" id="qty" name="qty[]"></td><td>'+v.nama_satuan+'</td><td style="width:30%;"><input type="text" value="" placeholder="masukkan catatan untuk barang ini" class="form-control" id="catatan" name="keterangan[]" value="'+v.keterangan+'"></td><td><a href="#" onclick="delItem(this)"  data-id="'+id_barang+'">Hapus</a></td></tr>';
						});
						$('.allItem').append(html);
					}
				}
			});

			$('.AddItemtoList').css('display','block');

		}

		$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				}
			});
			jQuery.ajax({
				url: "{{ url('/administrator/pemesanan/ajaxVendorGetItem') }}",
				method: 'post',
				data: {
					"data": $(a).val(),
					"_token": "{{ csrf_token() }}",
				},
				success: function(result){
					if(result.status == 200){
						var option = "<option disabled selected>-pilih barang-</option>";
						$.each(result.data, function(k, v){
							option += '<option value="'+v.id_barang+'">'+v.nama_barang+'</option>';
						});
						$('#id_barang').html(option);
						$(a).attr('readonly', 'readonly');
					}
				}
			});
	}
	var x = JSON.parse('<?php echo $arrData; ?>');
	var idBrg = [];

	$.each(x, function(k,v){
		idBrg.push(v);
	});
	
	function AddItemtoList(a){
		var id_barang = $('#id_barang :selected').val();
		var barang = $('#id_barang :selected').text();
		var qty = $('#qty').val();
		var satuan = $('#id_satuan').val();
		var harga = $('#harga').val();
		html = '<tr id="tr_'+id_barang+'"><td>'+barang+'<input type="hidden" value="'+id_barang+'" class="form-control" id="id_barang" name="id_barang[]"></td><td style="width:30%;"><input type="number" value="'+qty+'" class="form-control" id="qty" name="qty[]"></td><td>'+satuan+'</td><td>Rp. '+addCommas(harga)+'<input readonly type="hidden" value="'+harga+'" class="form-control" id="harga" name="harga[]"></td><td style="width:30%;"><input type="text" value="" placeholder="masukkan catatan untuk barang ini" class="form-control" id="catatan" name="keterangan[]"></td><td><a href="#" onclick="delItem(this)"  data-id="'+id_barang+'">Hapus</a></td></tr>';
						
		if(jQuery.inArray(id_barang.toString(), idBrg) == -1){
			$('.listItem').append(html);
			idBrg.push(id_barang);
		}else{
			$('.allItem #tr_'+id_barang+' #qty').select();
			var old = $('.allItem #tr_'+id_barang+' #qty').val();
			var baru = qty;
			var add = parseInt(old)+parseInt(baru);
			var max_qty = $('#qty').attr('max');

			if(add > max_qty){
				add = max_qty;
			}else{
				add = add;
			}
			$('.allItem #tr_'+id_barang+' #qty').val(add);
		}

		$('#id_barang').prop('selectedIndex',0);
		$('#qty').val('0');
		$('#harga').val('0');
		$('#id_satuan').val('-');
		$('.AddItemtoList').css('display','none');
		$('.submit').css('display', 'initial');
		$('#harga').attr('readonly', 'readonly');
	}

	function delItem(a){
		console.log(idBrg);
		$('#tr_'+$(a).data('id')).remove();
		var rowCount = $('.allItem tr').length;
		if(rowCount > 0){
			$('.submit').css('display', 'initial');
		}else{
			$('.submit').css('display', 'none');
		}

		var removeItem = $(a).data('id');

		idBrg = jQuery.grep(idBrg, function(value) {
		return value != removeItem;
		});
	}

	function BarangSelect(a){
		var id_barang = $('#id_barang').val();
		if(id_barang != '-pilih barang-'){
			$('#id_barang').css('display', 'inherit');
		}

		$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				}
			});
			jQuery.ajax({
				url: "{{ url('/administrator/pemesanan/ajaxBarangGetItem') }}",
				method: 'post',
				data: {
					"data": $(a).val(),
					"_token": "{{ csrf_token() }}",
				},
				success: function(result){
					if(result.status == 200){
						$('#id_satuan').val(result.data[0].nama_satuan);
						$('#qty').attr('max', result.data[0].qty);
						$('#qty').val(result.data[0].qty);
						$('#harga').val(result.data[0].harga_beli);
					}
				}
			});

			$('.AddItemtoList').css('display','block');
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
	}

	var old = 0;
	function qtyClick(a){
		old = $(a).val();
	}
	function qtyChange(a){
		var now = $(a).val();
		console.log("old: "+old);
		console.log("now: "+now);
		if(now != old){
			$('.submit').css('display', 'initial');
		}else{
			$('.submit').css('display', 'none');
		}
	}

	$('.myform').submit(function() {
		$('#id_vendor').removeAttr('disabled');
	});

	function addCommas(nStr){
		nStr += '';
		x = nStr.split(',');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + '.' + '$2');
		}
		return x1 + x2;
	}
  </script>
@endpush