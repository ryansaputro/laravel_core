@extends('backend.layouts.main')
@section('title')
Penerimaan
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
		@can('penerimaan-create')
			<a style="margin-right:10px;" href="penerimaan/create">
				Buat Penerimaan
			</a>
		@endcan
		<a href="" style="margin-right:10px;margin-left:10px;">Edit</a>
		<a href="" style="margin-left:10px;">Hapus</a>
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
					<th>Tanggal</th>
					<th>No Penerimaan</th>
					<th>No Pemesanan</th>
					<th>No Faktur</th>
					<th>Diterima Oleh</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach ($data as $key => $v)
				<tr data-id="{{$key+1}}" class="tdAction">
					<td>{{ $key+1}}</td>
					<td>{{ $v->tanggal_penerimaan}}</td>
					<td>{{ $v->no_penerimaan}}</td>
					<td>{{ $v->no_pemesanan}}</td>
					<td>{{ $v->no_faktur}}</td>
					<td>{{ $v->name}}</td>
					<td>
							@can('penerimaan-edit')
							{{--  <a class="edit" id="{{$key+1}}" style="display:none;" href="{{URL::to('administrator/pemesanan/'.md5($v->id_pemesanan).'/edit')}}">Edit</a>  --}}
							@endcan
							@can('penerimaan-delete')
							{{--  <form action="{{ route('pemesanan.update', ['id' => md5($v->id_pemesanan), 'key' => 'delete']) }}" class="myform" method="post" style="display:inline;" enctype="multipart/form-data">  --}}
							@csrf
							{{--  {!! Form::open(['method' => 'post','route' => ['pemesanan.update', $v->id_pemesanan, ],'style'=>'display:inline']) !!}  --}}
							{{--  <input type="hidden" name="_method" value="PUT">  --}}
							{{--  {!! Form::submit('Delete', ['class' => 'btn btn-default', 'style' => 'display:none;border: none;background: none;', 'id' => $key+1, 'class' => 'action']) !!}  --}}
							{{--  {!! Form::close() !!}  --}}
							{{--  </form>  --}}
							@endcan
						{{--  @if($v->status == '2')  --}}
						<a class="riwayat" style="display:none;" href="{{URL::to('administrator/penerimaan/'.md5($v->id_pemesanan))}}">Log</a>
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
                "targets": 6,
                "width": "10%"
            },
			{
				targets: [0], 
				searchable: false, 
				orderable: false, 
				visible: true 

			},

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
$("div.toolbar").html('<i class="fa fa-line-chart" aria-hidden="true"></i> <b>Overview Penerimaan</b><div style="border-bottom: 5px solid #ccc;margin-top: 38px;"></div>');
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
