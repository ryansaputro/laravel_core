@extends('backend.layouts.main')
@section('title')
Barang Vendor
@endsection
@section('new')
@endsection
@section('content')
<style>
	.riwayat:hover{
		color: #a99342;
	}
</style>
	<div class="upperTable">
		@can('barang_vendor-create')
		<a style="margin-right:10px;" href="{{URL::to('administrator/barang_vendor/create')}}">
			Buat Barang Vendor
		</a>
		@endcan
		{{--  <a href="{{URL::to('administrator/barang_vendor/import')}}" style="margin-right:10px;margin-left:10px;">Upload Barang</a>  --}}
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
					<th>Vendor</th>
					<th>Nama Barang</th>
					<th>Qty</th>
					<th>Satuan</th>
					<th>Harga Beli</th>
					<th>Harga Jual</th>
					<th>Status</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach ($data as $key => $v)
				<tr data-id="{{$key+1}}" class="tdAction">
					<td>{{ $key+1}}</td>
					<td>{{ $v->nama_vendor}}</td>
					<td>{{ $v->nama_barang}}</td>
					<td>{{ $v->qty}}</td>
					<td>{{ $v->nama_satuan}}</td>
					<td>{{ $v->harga_beli}}</td>
					<td>{{ $v->harga_jual}}</td>
					<td>{{ $v->status == '1' ? 'Aktif' : 'Tidak Aktif'}}</td>
					<td>
							@can('barang_vendor-edit')
							 <a class="edit" id="{{$key+1}}" style="display:none;" href="{{URL::to('administrator/barang_vendor/'.md5($v->id_barang_vendor).'/edit')}}">Edit</a> 
							@endcan
							@if($v->status == '1')
							@can('daftar_barang-delete')
								<form action="{{ route('barang_vendor.update', ['id' => md5($v->id_barang_vendor), 'key' => 'delete']) }}" class="myform" method="post" style="display:inline;" enctype="multipart/form-data"> 
								@csrf
								<input type="hidden" name="_method" value="PUT"> 
								{!! Form::submit('Delete', ['class' => 'btn btn-default', 'style' => 'display:none;border: none;background: none;', 'id' => $key+1, 'class' => 'action']) !!} 
								</form> 
							@endcan
							@endif
						{{--  @if($v->status == '2')  --}}
						{{-- <a class="riwayat" style="display:none;" href="{{URL::to('administrator/barang_vendor/'.md5($v->id_barang))}}">Log</a> --}}
						{{--  @endif  --}}
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
                "targets": 8,
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
