@extends('backend.layouts.main')

@section('title')
Menus
@endsection
@section('new')
@can('user-create')
<a href="users/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: 5px; border-radius: 5px; color: #9cd13a;">
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
	@endif
	<table class="mdl-data-table" id="myTable" style="width:100%">
		<thead>
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Description</th>
				<th>Status</th>
				<th>Order</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $val)
			@php
				if($val->rgt == '1'){
					$child = '---';
				}else if($val->rgt == '1'){
					$child = '----';
				}else if($val->rgt == '0'){
					$child = '';
				}else{
					$child = '-----';
				}
			@endphp
			<tr>
				<td>{{ $key+1}}</td>
				<td>{{$child}} {{ $val->name }}</td>
				<td>{{ $val->description }}</td>
				<td>{{ $val->status }}</td>
				<td>{{ $val->order }}</td>
				<td>
					<a class="btn btn-info" href="{{ route('users.show',$val->id) }}">Show</a>
					<a class="btn btn-primary" href="{{ route('users.edit',$val->id) }}">Edit</a>
					{!! Form::open(['method' => 'DELETE','route' => ['users.destroy', $val->id],'style'=>'display:inline']) !!}
					{!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
					{!! Form::close() !!}
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
