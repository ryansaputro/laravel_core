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
<form action="{{ route('pemesanan.store') }}" method="post" enctype="multipart/form-data">
	@csrf
	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif

	<div class="form-group col-xs-3 col-md-3">
        <label for="no_pemesanan" class="control-label">No Pemesanan</label>
        <input type="text" value='{{$no_pemesanan}}' class="form-control" id="no_pemesanan" required name="no_pemesanan">
    </div>
    <div class="form-group col-xs-3 col-md-3"  style="border-right: 2px solid #ddd;">
        <label for="dibuat_tgl" class="control-label">Tanggal Pemesanan</label>
        <input type="date" value="{{old('dibuat_tanggal')}}" class="form-control" id="dibuat_tgl" required name="dibuat_tgl">
	</div>
	<div class="vl"></div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_vendor" class="control-label">Vendor</label>
		<div class="input-group">
			<select data-live-search="true" class="form-control" id="id_vendor" required name="id_vendor" onchange="vendorSelect(this)">
				<option disabled selected>-pilih vendor-</option>
				@foreach($vendor AS $k => $v)
				<option value="{{$v->id_vendor}}">{{$v->nama_vendor}}</option>
				@endforeach
			</select>
			<span class="input-group-addon" ddata-toggle="tooltip" data-placement="right" title="klik untuk mengganti vendor" style="border-left: 1px solid #ddd;"><a class="refresh" style="color:red;" href="#id_vendor" onclick="ChangeVendor(this)"><i class="fa fa-refresh" aria-hidden="true"></i></a></span>
		</div>
    </div>
    <div class="form-group col-xs-3 col-md-3">
        <label for="id_barang" class="control-label">Nama Barang</label>
		<select data-live-search="true" class="form-control" id="id_barang" onchange="BarangSelect(this)" required name="id_barang">
			<option disabled selected>-pilih barang-</option>
		</select>

    </div>
    <div class="form-group col-xs-6 col-md-6">
		<label for="dibuat_oleh" class="control-label">Dibuat Oleh</label>
        <input type="text" value='{{Auth::user()->name}}' readonly class="form-control" id="dibuat_oleh" placeholder="dibuat_oleh">
    </div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="qty" class="control-label">Jumlah Pemesanan</label>
		<input type="number" value='' class="form-control" id="qty" required name="qty">
	</div>
	<div class="form-group col-xs-3 col-md-3">
		<label for="id_satuan" class="control-label">Satuan</label>
		<input type="text" value='' readonly class="form-control" id="id_satuan" placeholder="id_satuan">
	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="name" class="control-label">Status</label>
		<select class="form-control" id="status" required name="status">
			<option disabled selected>-pilih status-</option>
			<option value="1">sukses</option>
			<option value="6">draft</option>
		</select>
	</div>
	<div class="form-group col-xs-6 col-md-6">
		<label for="harga" class="control-label">Harga</label>
		<input type="text" readonly value='' class="form-control" id="harga" placeholder="harga">
	</div>
	<div class="form-group col-xs-6 col-md-6" style="float:right;">
		<a class="btn btn-primary btn-block AddItemtoList" onclick="AddItemtoList(this)">Masukkan ke daftar barang</a>
	</div>

	<div class="form-group col-xs-6 col-md-6" style="float:right;">
		<label for="catatan" class="control-label">Catatan</label>
		<input type="text" value='' class="form-control" id="catatan" required name="catatan">
	</div>

	<div class="form-group col-xs-12 col-md-12">
		<label for="name" class="control-label">Daftar Barang</label>
		<table class="table table-stripped listItem">
			<thead>
				<tr>
					<th>Nama</th>
					<th width="20%">Jumlah</th>
					<th>Satuan</th>
					<th width="20%">Catatan</th>
					<th>Aksi</th>
				</tr>
			</thead>
			<tbody class="allItem">

			</tbody>
		</table>
	</div>

	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
				<a class="btn btn-primary" href="{{ route('pemesanan.index') }}"> Batalkan</a>
				<button type="submit" class="btn btn-primary submit" style="display:none;">Order</button>
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
	var $j = jQuery.noConflict();
	$('.refresh').on('mouseover', function(){
		$j('[data-toggle="popover"]').popover(); 
		console.log("hover me")  
	});
   
	function vendorSelect(a){
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
						$(a).attr('disabled', true);
					}
				}
			});
	}
 
	var idBrg = [];

	function AddItemtoList(a){
		var id_barang = $('#id_barang :selected').val();
		var barang = $('#id_barang :selected').text();
		var qty = $('#qty').val();
		var satuan = $('#id_satuan').val();
		html = '<tr id="tr_'+id_barang+'"><td>'+barang+'<input type="hidden" value="'+id_barang+'" class="form-control" id="id_barang" name="id_barang[]"></td><td style="width:30%;"><input type="number" value="'+qty+'" class="form-control" id="qty" name="qty[]"></td><td>'+satuan+'</td><td style="width:30%;"><input type="text" value="" placeholder="masukkan catatan untuk barang ini" class="form-control" id="catatan" name="catatan[]"></td><td><a href="#" onclick="delItem(this)"  data-id="'+id_barang+'">Hapus</a></td></tr>';
		
		$('#id_barang').prop('selectedIndex',0);
		$('#qty').val('0');
		$('#harga').val('0');
		$('#id_satuan').val('-');
				
		if(jQuery.inArray(id_barang.toString(), idBrg) == -1){
			$('.listItem').append(html);
			idBrg.push(id_barang);
		}

		$('.AddItemtoList').css('display','none');
		
		$('.submit').css('display', 'initial');
	}

	function delItem(a){
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
		idBrg = [];
		$('#id_vendor').prop('selectedIndex',0);
		$('.allItem tr').remove();
		$('#id_vendor').removeAttr('readonly');
		$('#id_vendor').attr('disabled', false);
	}

  </script>
@endpush