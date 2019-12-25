@extends('backend.layouts.main')
@section('title')
Stok {{$data[0]->nama_barang}}
@endsection
@section('new')
@endsection
@section('content')
<style>
	.riwayat:hover{
		color: #a99342;
	}
	.sign{
		background: url(https://cdn1.iconfinder.com/data/icons/law-copyright-volume-1/512/Copyright_Expiry-512.png);
		background-size: contain;
		background-repeat: no-repeat;
	}
</style>
	<div class="upperTable">
		@can('barang_vendor-create')
		{{--  <a style="margin-right:10px;" href="{{URL::to('administrator/barang_vendor/create')}}">
			Buat Barang Vendor
		</a>  --}}
		@endcan
		<a href="{{URL::to('/administrator/stok')}}" style="margin-right:10px;margin-left:10px;">Kembali</a>
		{{--  <a href="{{ asset('/template/template.xls') }}" target="_blank" style="margin-left:10px;">Download Template</a>  --}}
	</div>
	@if ($message = Session::get('success'))
		<div class="alert alert-success">
			<p>{{ $message }}</p>
		</div>
	@elseif ($message = Session::get('danger'))
		<div class="alert alert-danger">
			<p>{{ $message }}</p>
		</div>
	@endif
	@php
		$now = date('Y-m-d H:i:s');	
	@endphp
	<div class="table-responsive">
		<table class="mdl-data-table" id="myTable" style="width:100%">
			<thead>
				<tr>
					<th>No</th>
					<th>Nama Barang</th>
					<th>Stok</th>
					<th>No Batch</th>
					<th>Tanggal Kadaluarsa</th>
					<th>Vendor</th>
				</tr>
			</thead>
			<tbody>
				@foreach ($data as $key => $v)
				<tr data-id="{{$key+1}}" class="tdAction {{ $now>$v->tanggal_kadaluarsa ? 'sign' : ''}}">
					<td>{{ $key+1}}</td>
					<td>{{ $v->nama_barang}}</td>
					<td>{{ $v->qty}} {{ $v->nama_satuan}}</td>
					<td>{{ $v->no_batch}}</td>
					<td>{{ $v->tanggal_kadaluarsa}}</td>
					<td>{{ $v->nama_vendor}}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>
@endsection

@push('scripts')
<script>

$(document).ready(function() {
    $('#myTable').DataTable( {
	"bPaginate": true,
    "bLengthChange": false,
    "bFilter": true,
    "bInfo": true,
	"bAutoWidth": false ,
	"dom": '<"toolbar">frtip',
        columnDefs: [
			{
				targets: [0], 
				searchable: false, 
				orderable: false, 
				visible: true 

			},

		],
	dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],
		
		language: {
		searchPlaceholder: "Pencarian...",
		search: '',
	}
	
} );
$("div.toolbar").css('float', 'left');
$("div.toolbar").css('color', '#777777');
$("div.toolbar").css('font-size', 'large');
$("div.toolbar").css('padding-left', '10px');
$("div.toolbar").css('margin-top', '10px');
$("div.toolbar").html('<i class="fa fa-line-chart" aria-hidden="true"></i> <b>Overview Barang Vendor</b><div style="border-bottom: 5px solid #ccc;margin-top: 38px;"></div>');
} );


$('.tdAction').hover(function() {             
	$(this).find('td').find('input.action').css('display', 'inherit');
	$(this).find('td').find('.edit').css('display', 'contents');
	$(this).find('td').find('.riwayat').css('display', 'contents');
	$(this).addClass('current-row');
}, function() {
	$(this).find('td').find('input.action').css('display', 'none');
	$(this).find('td').find('.edit').css('display', 'none');
	$(this).find('td').find('.riwayat').css('display', 'none');
	$(this).removeClass('current-row');
});

</script>

@endpush
