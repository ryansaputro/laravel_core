@extends('backend.layouts.main')
@section('title')
Buat Penerimaan
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
<form action="{{ route('penerimaan.store') }}" class="myform" method="post" enctype="multipart/form-data">
	@csrf
	@if (session('success'))
		<div class="alert alert-success">
			{{ session('success') }}
		</div>
	@endif

	<div class="form-group col-md-3">
        <label for="no_penerimaan" class="control-label">No Penerimaan</label>
        <input type="text" value='{{$no_penerimaan}}' class="form-control" id="no_penerimaan" required name="no_penerimaan">
    </div>
    <div class="form-group col-md-3"  style="border-right: 2px solid #ddd;">
        <label for="dibuat_tgl" class="control-label">Tanggal Penerimaan</label>
        <input type="date" value="{{date('Y-m-d')}}" readonly class="form-control" id="dibuat_tgl_penerimaan" required name="dibuat_tgl">
	</div>
	<div class="vl"></div>
	<div class="form-group  col-md-6">
		<label for="no_pemesanan" class="control-label">No Pemesanan</label>
			<select data-live-search="true" class="form-control" id="no_pemesanan" required name="no_pemesanan" onchange="PesananSelect(this)">
				<option disabled selected>-pilih no pemesanan-</option>
				@foreach($pemesanan AS $k => $v)
				<option value="{{$v->id_pemesanan}}">{{$v->no_pemesanan}}</option>
				@endforeach
			</select>
    </div>
    <div class="form-group col-md-3">
		<label for="no_faktur" class="control-label">No Faktur</label>
        <input type="text" value='' required name="no_faktur" class="form-control" id="no_faktur" placeholder="no_faktur">
    </div>
    <div class="form-group col-md-3">
		<label for="dibuat_oleh" class="control-label">Dibuat Oleh</label>
        <input type="text" value='{{Auth::user()->name}}' readonly class="form-control" id="dibuat_oleh_receive" placeholder="dibuat_oleh">
    </div>
	<div class="form-group col-md-3">
		<label for="dibuat_tgl" class="control-label">Tanggal Pemesanan</label>
		<input type="text" value='' readonly class="form-control" id="dibuat_tgl" required name="dibuat_tgl">
	</div>
	<div class="form-group col-md-3">
		<label for="dibuat_oleh" class="control-label">Dibuat Oleh</label>
		<input type="text" value='' readonly class="form-control" id="dibuat_oleh" placeholder="dibuat_oleh">
	</div>
		<div class="form-group  col-md-6">
		<label for="catatan" class="control-label">Catatan</label>
		<input type="text" value='' class="form-control" id="catatan" required name="catatan">
	</div>

	<div class="form-group  col-md-6">
		<label for="id_vendor" class="control-label">Vendor</label>
			<input type="text" readonly value='' class="form-control" id="id_vendor" placeholder="id_vendor">
	</div>
	<div class="form-group  col-md-6" style="float:right;">
		<a class="btn btn-primary btn-block AddItemtoList">Tampilkan ke daftar barang</a>
	</div>

	
	<div class="form-group col-md-12">
		<label for="name" class="control-label">Daftar Barang</label>
		<div class="table-responsive">
			<table class="table table-stripped listItem">
				<thead>
					<tr>
						<th>Nama</th>
						<th>Jumlah</th>
						<th>Satuan</th>
						<th>Harga</th>
						<th>Catatan</th>
						<th>Rak</th>
						<th>No Batch</th>
						<th>Tanggal Kadaluarsa</th>
					</tr>
				</thead>
				<tbody class="allItem">

				</tbody>
			</table>
		</div>
	</div>

	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
				<a class="btn btn-primary" href="{{ route('penerimaan.index') }}"> Batalkan</a>
				<button type="submit" class="btn btn-primary submit" style="display:none;">Terima</button>
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
	});

	$(document).ready(function(){
		$('.AddItemtoList').css('display', 'none');
	});
   
	function PesananSelect(a){
		$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				}
			});
			jQuery.ajax({
				url: "{{ url('/administrator/penerimaan/ajaxOrderGetItem') }}",
				method: 'post',
				data: {
					"id_pemesanan": $(a).val(),
					"_token": "{{ csrf_token() }}",
				},
				success: function(result){
					if(result.status == 200){
						console.log(result);

						$('#dibuat_tgl').attr('value',result.data.dibuat_tgl)
						$('#dibuat_oleh').attr('value',result.data.name)
						$('#id_vendor').attr('value',result.data.nama_vendor)
						$('.AddItemtoList').css('display', 'block');

						$('.AddItemtoList').on('click', function(){
							var html ="";
							var rak ="";
							var qty =[];
							var qtyNew = result.dataNew;
							var qtyOld = result.dataOld;

							$.each(result.rak, function(k,v){
								rak += '<option value="'+v.id_rak+'">'+v.nama_rak+'</option>'
							});

							$.each(result.detail, function(k,v){
								if(qtyNew.length == 0){
									qty[v.id_barang] = qtyOld[v.id_barang];
								}else{
									qty[v.id_barang] = (qtyOld[v.id_barang]-qtyNew[v.id_barang]);
								}
								var keterangan = v.keterangan != null ? v.keterangan : '-';
								if(qty[v.id_barang] > 0){
									html += '<tr id="tr_'+v.id_barang+'"><td>'+v.nama_barang+'<input type="hidden" value="'+v.id_barang+'" class="form-control" id="id_barang" name="id_barang[]"></td><td><input type="number" value="'+qty[v.id_barang]+'" class="form-control" id="qty" name="qty[]"></td><td>'+v.nama_satuan+'</td><td>Rp. '+addCommas(v.harga)+'<input readonly type="hidden" value="'+v.harga+'" class="form-control" id="harga" name="harga[]"></td><td>'+keterangan+'</td><td><select required class="form-control" name="id_rak[]"><option disabled selected>-pilih rak-</option>'+rak+'</select></td><td><input required type="number" value="" class="form-control" id="no_batch" placeholder="masukkan no batch" name="no_batch[]"></td><td><input required type="date" value="" class="form-control" id="tanggal_kadaluarsa" name="tanggal_kadaluarsa[]"></td></tr>';
								}
							});
							$('.allItem').html(html);
							$('.submit').css('display', 'initial');
						});
					}
				}
			});
	}
 
	var idBrg = [];

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