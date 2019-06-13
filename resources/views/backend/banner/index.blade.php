@extends('backend.layouts.main')
@section('title')
Banner
@endsection
@section('new')
@can('banner-create')
<a href="banner/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: 5px; border-radius: 5px; color: #9cd13a;">
	<i class="fa fa-plus"></i> Tambah
	<p class="hidden-lg hidden-md">Dashboard</p>
</a>
@endcan
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
	<table class="mdl-data-table" id="myTable" style="width:100%">
		<thead>
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Description</th>
				<th>Banner</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $val)
			<tr>
				<td>{{ $key+1}}</td>
				<td>{{ $val->name }}</td>
				<td>@php echo html_entity_decode($val->description, ENT_QUOTES, 'UTF-8'); @endphp</td>
				<td style="background-image:url('{{asset('images/banner/'.$val->data)}}'); background-size:cover; background-position:center;"></td>
				<td><label class="badge badge-{{ $val->status == '1' ? 'success' : 'danger'}}">{{ $val->status == '1' ? 'Aktif' : 'Non Aktif'}}</label></td>
				<td>
					@can('banner-edit')
					<a class="btn btn-primary" href="{{ route('banner.edit',$val->id) }}">Edit</a>
					@endcan
					@can('banner-delete')
					{!! Form::open(['method' => 'DELETE','route' => ['banner.destroy', $val->id],'style'=>'display:inline']) !!}
					{!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
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
        columnDefs: [
            {
                targets: [ 0, 1, 2 ],
                className: 'mdl-data-table__cell--non-numeric'
            }
        ]
    } );
} );

</script>

@endpush
