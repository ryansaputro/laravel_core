@extends('backend.layouts.main')
@section('title')
Stok
@endsection
@section('new')
@endsection
@section('content')
<style>
	.riwayat:hover{
		color: #a99342;
	}
</style>
	<div class="upperTable" style="border-bottom:none;">
		@can('barang_vendor-create')
		{{--  <a style="margin-right:10px;" href="{{URL::to('administrator/barang_vendor/create')}}">
			Buat Barang Vendor
		</a>  --}}
		@endcan
		{{--  <a href="{{URL::to('/administrator/stok_per_rak')}}" style="margin-right:10px;margin-left:10px;">Stok Barang per Rak</a>  --}}
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
	<div class="table-responsive">
		<table class="mdl-data-table" id="myTable" style="width:100%">
			<thead>
				<tr>
					<th>No</th>
					<th>Nama Barang</th>
					<th>Stok</th>
					<th>Satuan</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach ($data as $key => $v)
				<tr data-id="{{$key+1}}" class="tdAction" style="background:{{$v->stok <= $v->stock_minimal ? 'red': 'none'}};color:{{$v->stok <= $v->stock_minimal ? '#fff': 'none'}}">
					<td>{{ $key+1}}</td>
					<td>{{ $v->nama_barang}}</td>
					<td>{{ $v->stok}}</td>
					<td>{{ $v->nama_satuan}}</td>
					<td>
							@can('daftar_barang-edit')
							<a class="edit" id="{{$key+1}}" style="display:none;" href="{{URL::to('administrator/stok/'.md5($v->id_barang).'/detail')}}">Detail</a> 
							@endcan
					</td>
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
                "targets": 4,
                "width": "15%"
            },
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
