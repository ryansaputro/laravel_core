@extends('backend.layouts.main')
@section('title')
Tambah Halaman
@endsection
@section('content')
<link href="{{ asset('/css/backend/texteditor/summernote.css') }}" rel="stylesheet">
	<div class="row">
	    <div class="col-lg-12 margin-tb">
	        <div class="pull-right">
	            <a class="btn btn-primary" href="{{ route('pages.index') }}"> Back</a>
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
	{!! Form::open(array('route' => 'pages.store','method'=>'POST')) !!}
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Nama:</strong>
                {!! Form::text('name', null, array('placeholder' => 'Nama','class' => 'form-control')) !!}
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
				<strong>Tipe Halaman:</strong>
				 <br>
				<label>{{ Form::radio('pages_type', 'query', null, array('class' => 'pages_type', 'onclick' => 'postType(this)')) }}
					Query 
				</label> 
				<br>
				<label>{{ Form::radio('pages_type', 'custom', null, array('class' => 'pages_type', 'onclick' => 'postType(this)')) }}
					Custom 
				</label>
				{{--  <br>
				<label>{{ Form::radio('pages_type', 'form', null, array('class' => 'pages_type', 'onclick' => 'postType(this)')) }}
					Form 
				</label>  --}}
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12 option">
            <div class="form-group form-custom" style="display: block;">
			</div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Status:</strong>
				<label>{{ Form::radio('status', 1, null, array('class' => 'status', 'checked')) }}
					Aktif 
				</label>
				<label>{{ Form::radio('status', 0, null, array('class' => 'status')) }}
					Non Aktif 
				</label>
            </div>
        </div>
        
        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
        </div>
	</div>
	{!! Form::close() !!}

@endsection

@push('scripts')
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/jquery.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/bootstrap.min.js') }}"></script> 
<script type="text/javascript" src="{{ asset('/js/backend/texteditor/summernote.js') }}"></script> 

	<script>
		function postType(a){
			var postType = $(a).val();
			if(postType == 'custom'){
				$(document).ready(function() {
					$('.summernote').summernote({
						height: 300,
						tabsize: 2,
					});
					{{--  $('.summernote').on('summernote.init', function () {
					$('.summernote').summernote('codeview.activate');
					}).summernote({
						height: 300,
						tabsize: 2,
					});  --}}					
				});

				var custom = '<textarea name="custom_html" class="summernote"></textarea>';
				$('.form-custom').html(custom);
				$('.form-custom').css('display', 'block');
			}else{
				var query = '<strong>Pilih Table:</strong>'+
							'<select class="form-control" name="table" onchange="tableChange(this)">'+
								'<option selected disabled>-pilih-</option>'+
								'@foreach ($tables as $table)'+
									'<option value="{{$table->Tables_in_adsProject}}">{{$table->Tables_in_adsProject}}</option>'+
								'@endforeach'+
							'</select>'+
							'<strong>Kondisi:</strong>'+
							'<select class="form-control condition" name="condition" style="width:50%;">'+
								'<option selected disabled>-pilih-</option>'+
							'</select>'+
							'<input type="text" name="filter" class="form-control" placeholder="Nilai" style="width:30%; float:right;margin-top:-40px;">'+
							'<select class="form-control operator" name="operator" style="width:20%;float:right;margin-top:-40px;margin-right:30%;">'+
								'<option selected disabled>-pilih-</option>'+
								'<option value="LIKE">LIKE</option>'+
								'<option value="NOT LIKE">NOT LIKE</option>'+
								'<option value="LIKE %...%">LIKE%...%</option>'+
								'<option value="=">=</option>'+
								'<option value="!=">!=</option>'+
							'</select>'+
							'<strong>Order By:</strong>'+
							'<select class="form-control condition" name="orderby" style="width:70%;">'+
								'<option selected disabled>-pilih-</option>'+
							'</select>'+
							'<select class="form-control orderby" name="orderbyAtoZ" style="width:30%;float:right;margin-top:-40px;">'+
								'<option value="DESC">DESCENDING</option>'+
								'<option value="ASC">ASCENDING</option>'+
							'</select>'+
							'<strong>Group By:</strong>'+
							'<select class="form-control condition" name="groupby">'+
								'<option selected disabled>-pilih-</option>'+
							'</select>';
								$('.form-custom').html(query);

			}
		}

	
		function tableChange(a){
			$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				}
			});
			jQuery.ajax({
				url: "{{ url('/administrator/pages/ajaxFieldPages') }}",
				method: 'post',
				data: {
					"data": $(a).val(),
					"_token": "{{ csrf_token() }}",
				},
				success: function(result){
					console.log(result)
					if(result.status == 200){
						var option = "<option value='none'>none</option>";
						$.each(result.data, function(k, v){
							option += '<option value="'+v+'">'+v+'</option>';
						});
						$('.condition').html(option)
					}
				}
			});
		}

		$('.attribute').on('change', function(){
			alert($(this).val())
			if($(this).val() === 'GROUP BY'){
				alert("true")
				$('.orderby').attr('disabled', 'disabled');
			}else{
				alert("else")
				$('.orderby').removeAttr('disabled');
			}
		})
	</script>
@endpush