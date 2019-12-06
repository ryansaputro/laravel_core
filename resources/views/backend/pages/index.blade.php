@extends('backend.layouts.main')
@section('title')
Halaman
@endsection
@section('new')
@can('pages-create')
<a href="pages/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: 5px; border-radius: 5px; color: #9cd13a;">
	<i class="fa fa-plus"></i> Tambah
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
				<th>Url</th>
				<th>Page Type</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $val)
			<tr>
				<td>{{ $key+1}}</td>
				<td>{{ $val->name }}</td>
				<td><a href="{{ $val->url }}">{{ $val->url }}</a></td>
				<td>{{ $val->pages_type }}</td>
				<td><label class="badge badge-{{ $val->status == '1' ? 'success' : 'danger'}}">{{ $val->status == '1' ? 'Aktif' : 'Non Aktif'}}</label></td>
				<td>
					<a class="btn btn-info" href="{{ $val->url }}">Show</a>
					@can('pages-edit')
					<a class="btn btn-primary" href="{{ route('pages.edit',$val->id) }}">Edit</a>
					@endcan
					@can('pages-delete')
					{!! Form::open(['method' => 'DELETE','route' => ['pages.destroy', $val->id],'style'=>'display:inline']) !!}
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
