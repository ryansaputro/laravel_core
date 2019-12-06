@extends('backend.layouts.main')
@section('title')
Tambah Permission
@endsection
@section('content')
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
	            <a class="btn btn-primary" href="{{ route('permission.index') }}"> Back</a>
	        </div>
	    </div>
	</div>
	@if (count($errors) > 0)
		<div class="alert alert-danger">
			<strong>Whoops!</strong> There were some problems with your input.<br><br>
			<ul>
				@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
				@endforeach
			</ul>
		</div>
	@endif
	{!! Form::open(array('route' => 'permission.store','method'=>'POST')) !!}
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Nama:</strong>
                {!! Form::text('ref', null, array('placeholder' => 'Nama','class' => 'form-control', 'oninput' => 'permissionInput(this)')) !!}
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12">
			<div class="form-group">
				<strong>Referensi Permission</strong>
				<br>
					<label class="list" style="cursor:cell;">
						{{ Form::checkbox('name[]', 1, null, array('class' => 'ListInput', 'disabled')) }}
						<span class="spanList">List</span> 
					</label>
					<br>
					<label class="create"  style="cursor:cell;">
						{{ Form::checkbox('name[]', 0, null, array('class' => 'CreateInput', 'disabled')) }}
						<span class="spanCreate">Create</span> 
					</label>
					<br>
					<label class="edit"  style="cursor:cell;">
						{{ Form::checkbox('name[]', 0, null, array('class' => 'EditInput', 'disabled')) }}
						<span class="spanEdit">Edit</span> 
					</label>
					<br>
					<label class="delete"  style="cursor:cell;">
						{{ Form::checkbox('name[]', 0, null, array('class' => 'DeleteInput', 'disabled')) }}
						<span class="spanDelete">Delete</span> 
					</label>
			</div>
		</div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Nama Guard:</strong>
                {!! Form::text('guard_name', 'web', array('placeholder' => 'Nama Guard','class' => 'form-control', 'readonly')) !!}
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
        </div>
	</div>
	{!! Form::close() !!}
@endsection
@push('scripts')
	<script>
		function permissionInput(a){
			$('label.list span.spanList').text($(a).val()+"-list");
			$('.ListInput').val($(a).val()+"-list");
			$('.ListInput').removeAttr('disabled');
			$('label.create span.spanCreate').text($(a).val()+"-create");
			$('.CreateInput').val($(a).val()+"-create");
			$('label.edit span.spanEdit').text($(a).val()+"-edit");
			$('.EditInput').val($(a).val()+"-edit");
			$('label.delete span.spanDelete').text($(a).val()+"-delete");
			$('.DeleteInput').val($(a).val()+"-delete");

			var list = $('.ListInput').val();
			var create = $('.CreateInput').val();
			var edit = $('.EditInput').val();
			var deletes = $('.DeleteInput').val();

			if(list == '-list'){
				$('.ListInput').attr('disabled', 'disabled');
			}else if(create == '-create'){
				$('.CreateInput').attr('disabled', 'disabled');
			}else if(edit == '-edit'){
				$('.EditInput').attr('disabled', 'disabled');		
			}else if(deletes == '-delete'){
				$('.DeleteInput').attr('disabled', 'disabled');	
			}else{
				$('.ListInput').removeAttr('disabled');
				$('.CreateInput').removeAttr('disabled');
				$('.EditInput').removeAttr('disabled');		
				$('.DeleteInput').removeAttr('disabled');	
			}
		}
	</script>
@endpush