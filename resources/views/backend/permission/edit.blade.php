@extends('backend.layouts.main')
@section('title')
Sunting Permission
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
    {!! Form::model($permission, ['method' => 'PATCH','route' => ['permission.update', $permission->id]]) !!}
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
						{{ Form::checkbox('name['.$permissionArrId[$nameLike[0]."-list"].']', $permissionArrId[$nameLike[0].'-list'], null, array('class' => 'ListInput', in_array($nameLike[0].'-list', $permissionArr) ? 'checked' : '')) }}
						<span class="spanList">{{in_array($nameLike[0].'-list', $permissionArr) ? $permissionArr[$permissionArrId[$nameLike[0].'-list']] : 'List'}}</span> 
					</label>
					<br>
					<label class="create"  style="cursor:cell;">
						{{ Form::checkbox('name['.$permissionArrId[$nameLike[0]."-create"].']', $permissionArrId[$nameLike[0].'-create'], null, array('class' => 'CreateInput', in_array($nameLike[0].'-create', $permissionArr) ? 'checked' : '')) }}
						<span class="spanCreate">{{in_array($nameLike[0].'-list', $permissionArr) ? $permissionArr[$permissionArrId[$nameLike[0].'-create']] : 'Create'}}</span> 
					</label>
					<br>
					<label class="edit"  style="cursor:cell;">
						{{ Form::checkbox('name['.$permissionArrId[$nameLike[0]."-edit"].']', $permissionArrId[$nameLike[0].'-edit'], null, array('class' => 'EditInput', in_array($nameLike[0].'-edit', $permissionArr) ? 'checked' : '')) }}
						<span class="spanEdit">{{in_array($nameLike[0].'-list', $permissionArr) ? $permissionArr[$permissionArrId[$nameLike[0].'-edit']] : 'Edit'}}</span> 
					</label>
					<br>
					<label class="delete"  style="cursor:cell;">
						{{ Form::checkbox('name['.$permissionArrId[$nameLike[0]."-delete"].']', $permissionArrId[$nameLike[0].'-delete'], null, array('class' => 'DeleteInput', in_array($nameLike[0].'-delete', $permissionArr) ? 'checked' : '')) }}
						<span class="spanDelete">{{in_array($nameLike[0].'-list', $permissionArr) ? $permissionArr[$permissionArrId[$nameLike[0].'-delete']] : 'Delete'}}</span> 
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