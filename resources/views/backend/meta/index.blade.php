@extends('backend.layouts.main')

@section('title')
Meta
@endsection
@section('new')
@can('meta-create')
<a href="meta/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: 5px; border-radius: 5px; color: #9cd13a;">
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
				<th>Content</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $val)
			<tr>
				<td>{{ $key+1}}</td>
				<td>{{ $val->name }}</td>
				<td>{{ $val->description }}</td>
				<td>{{ $val->content }}</td>
				<td><label class="badge badge-{{ $val->status == '1' ? 'success' : 'danger'}}">{{ $val->status == '1' ? 'Aktif' : 'Non Aktif'}}</label></td>
				<td>
					<a class="btn btn-info" href="{{ route('meta.show',$val->id) }}">Show</a>
					@can('meta-edit')
					<a class="btn btn-primary" href="{{ route('meta.edit',$val->id) }}">Edit</a>
					@endcan
					@can('meta-delete')
					{!! Form::open(['method' => 'DELETE','route' => ['meta.destroy', $val->id],'style'=>'display:inline']) !!}
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
