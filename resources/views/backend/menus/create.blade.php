@extends('backend.layouts.main')
@section('title')
Tambah Menu
@endsection
@section('content')
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
	            <a class="btn btn-primary" href="{{ route('menus.index') }}"> Back</a>
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
	{!! Form::open(array('route' => 'menus.store','method'=>'POST')) !!}
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Icon:</strong>
                <select name="icon" data-show-content="true"  class="form-control" id="mySelect">
                    <option disabled selected>-pilih-</option>
                      @foreach ($icons as $k => $v)
                        <option data-content="<i class='{{$v}}'></i>">{{$v}}</option>
                    @endforeach
                </select>
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Name:</strong>
                {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Menu Roles:</strong>
                <select name="menu_role" class="form-control">
                    <option disabled selected>-pilih-</option>
                      @foreach ($menuRoles as $k => $v)
                        <option value="{{$v->id}}">{{$v->name}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Url:</strong>
                <select name="url" data-show-content="true"  class="form-control" id="mySelect">
                    <option disabled selected>-pilih-</option>
                      @foreach ($pages as $k => $v)
                        <option value="{{$v->url}}">{{$v->url}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Description:</strong>
                {!! Form::textarea('description', null,  array('class' => 'summernote')) !!}
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
        </div>
	</div>
	{!! Form::close() !!}
<link href="{{ asset('/css/backend/texteditor/summernote.css') }}" rel="stylesheet">
@endsection
@push('scripts')
<!-- include libraries(jQuery, bootstrap) -->
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/jquery.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/bootstrap.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/summernote.js') }}"></script> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.10/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('.summernote').summernote({
        height: 300,
        tabsize: 2
      });

      
      $(function () {
            $('#mySelect').selectpicker();
        });

          $('#mySelect').focus();

    });
  </script>

@endpush