@extends('backend.layouts.main')

@section('title')
User Management
@endsection
@section('new')
@can('user-create')
<a href="users/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: auto; border-radius: 5px; color: #9cd13a;">
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
				<th>Email</th>
				<th>Roles</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($data as $key => $user)
			<tr>
				<td>{{ $key+1}}</td>
				<td>{{ $user->name }}</td>
				<td>{{ $user->email }}</td>
				<td>
					@if(!empty($user->getRoleNames()))
						@foreach($user->getRoleNames() as $v)
						<label class="badge badge-success">{{ $v }}</label>
						@endforeach
					@endif
				</td>
				<td>
					<a class="btn btn-info" href="{{ route('users.show',$user->id) }}">Show</a>
					<a class="btn btn-primary" href="{{ route('users.edit',$user->id) }}">Edit</a>
					{!! Form::open(['method' => 'DELETE','route' => ['users.destroy', $user->id],'style'=>'display:inline']) !!}
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
