@extends('backend.layouts.main')

@section('title')
Log History
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
				<th>ID</th>
				<th>Table</th>
				<th>Field</th>
				<th>Value</th>
				<th>Event</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $val)
			<tr>
				<td>{{ $key+1}}</td>
				<td>{{ $val->id_data }}</td>
				<td>{{ $val->table_data }}</td>
				<td>{{ $val->field }}</td>
				<td>{{ substr($val->values,0,50)}} {{ strlen($val->values) > 50 ? '...' : ''}}</td>
				<td>{{ $val->event }}</td>
				<td>{{ $val->created_at }}</td>
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
