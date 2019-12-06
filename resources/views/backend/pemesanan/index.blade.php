@extends('backend.layouts.main')
@section('title')
Pemesanan
@endsection
@section('new')
@endsection
@section('content')

	@if ($message = Session::get('success'))
		<div class="alert alert-success">
			<p>{{ $message }}</p>
		</div>
	@elseif ($message = Session::get('danger'))
		<div class="alert alert-danger">
			<p>{{ $message }}</p>
		</div>
	@endif
	<div class="upperTable">
		{{--  <div class="col-sm-1">
			<div class="checkbox">
				<label>
					<input type="checkbox" value="">
					<span class="cr"><i class="cr-icon fa fa-check"></i></span>
				</label>
			</div>
		</div>
	</div>  --}}
		@can('banner-create')
			<a style="margin-right:10px;" href="pemesanan/create">
				Buat Pesanan
			</a>
		@endcan
		<a href="" style="margin-right:10px;margin-left:10px;">Edit</a>
		<a href="" style="margin-left:10px;">Hapus</a>
	</div>
	
	<table class="mdl-data-table" id="myTable" style="width:100%">
		<thead>
			<tr>
				<th>
					<div class="checkbox">
						<label>
							<input type="checkbox" value="">
							<span class="cr" style="margin-top: 10px;"><i class="cr-icon fa fa-check"></i></span>
						</label>
					</div>
				</th>
				<th>No</th>
				<th>Tanggal</th>
				<th>No Pemesanan</th>
				<th>Vendor</th>
				<th>Status</th>
				<th>Dibuat Oleh</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $v)
			@php
				if($v->status == 1){
					$color = "#1dc7ea";
					$status = "sukses";
				}else if($v->status == 2){
					$color = "#337ab7";
					$status = "revisi";
				}else if($v->status == 3){
					$color = "#87cb16";
					$status = "selesai";
				}else if($v->status == 4){
					$color = "red";
					$status = "sampah";
				}else if($v->status == 5){
					$color = "yellow";
					$status = "barang belum lengkap";
				}else if($v->status == 6){
					$color = "#9a9a9a";
					$status = "draft";
				}	
			@endphp
			<tr data-id="{{$key+1}}" class="tdAction">
				<td>
					<div class="checkbox">
						<label>
							<input type="checkbox" value="">
							<span class="cr"><i class="cr-icon fa fa-check"></i></span>
						</label>
					</div>
				</td>
				<td>{{ $key+1}}</td>
				<td>{{ $v->dibuat_tgl}}</td>
				<td>{{ $v->no_pemesanan}}</td>
				<td>{{ $v->nama_vendor}}</td>
				<td><label class="badge" style="background:{{$color}};">{{$status}}</label></td>
				<td>Ryan</td>
				<td>
					@can('banner-edit')
					<a class="edit" id="{{$key+1}}" style="display:none;" href="{{URL::to('administrator/pemesanan/'.$v->id_pemesanan.'/edit')}}">Edit</a>
					@endcan
					@can('banner-delete')
					{{--  {!! Form::open(['method' => 'DELETE','route' => ['banner.destroy', $val->id],'style'=>'display:inline']) !!}  --}}
					{!! Form::submit('Delete', ['class' => 'btn btn-default', 'style' => 'display:none;border: none;background: none;', 'id' => $key+1, 'class' => 'action']) !!}
					{!! Form::close() !!}
					@endcan
				</td>
			</tr>
			@endforeach
		</tbody>
	</table>
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
                targets: [0, 1, 2 ],
				className: 'mdl-data-table__cell--non-numeric',
			},
			{
				width: "18%", 
				targets: [7],
			},
			{
				targets: [0], 
				searchable: false, 
				orderable: false, 
				visible: true 

			}
		],
		select: {
            style:    'os',
            selector: 'td:first-child'
        },
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
$("div.toolbar").html('<i class="fa fa-line-chart" aria-hidden="true"></i> <b>Overview Pemesanan</b><div style="border-bottom: 5px solid #ccc;margin-top: 38px;"></div>');
} );


$('.tdAction').hover(function() {             
	$(this).find('td').find('input.action').css('display', 'inherit');
	$(this).find('td').find('.edit').css('display', 'contents');
	$(this).addClass('current-row');
}, function() {
	$(this).find('td').find('input.action').css('display', 'none');
	$(this).find('td').find('.edit').css('display', 'none');
	$(this).removeClass('current-row');
});

</script>

@endpush