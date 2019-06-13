@extends('backend.layouts.main')

@section('title')
Menus
@endsection
@section('new')
@can('menu-create')
<a href="menus/create" class="dropdown-toggle" style="border: 2px solid #9cd13a;padding: 5px; border-radius: 5px; color: #9cd13a;">
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
	<div style="display: none;" id="notif">
	</div>
	<p><em>Note: This menu has the <code>maxLevels</code> option set to '4'.</em></p>
<section id="demo">
	@php
		$parent = $data->where('id_parent', '0');
		$child = $data->where('id_parent', '<>',  '0');
	@endphp
		<ol class="sortable ui-sortable mjs-nestedSortable-branch mjs-nestedSortable-expanded">
		   @foreach ($parent as $key => $val)
					<li class="mjs-nestedSortable-leaf" id="menuItem_{{$val->id}}">
						<div class="menuDiv" style="{{$val->status == '0' ? 'background:#d08585;' : ''}}">
							<span>
								<span data-id="{{$val->id}}" class="itemTitle">{{$val->name}} <i>(url : <a href="{{$val->url}}" target="_blank">{{$val->url}}</a>)</i></span>
								@can('menu-delete')
									<button style="float: right;" class="btn btn-sm btn-danger" onclick="Delete({{$val->id}})">Delete</button>
								@endcan
								@can('menu-edit')
									<a href="{{ route('menus.edit',$val->id) }}" style="float: right; margin-right:2px;" class="btn btn-sm btn-primary" onclick="Edit({{$val->id}})">Edit</a>
								@endcan
							<div id="menuEdit{{$val->id}}" class="menuEdit" style="margin-top:13px;">
								<p>
									@php echo html_entity_decode($val->description, ENT_QUOTES, 'UTF-8'); @endphp
								</p>
							</div>
						</div>
						<ol class="sortable ui-sortable mjs-nestedSortable-branch mjs-nestedSortable-expanded">
							@foreach ($child->where('id_parent', $val->id) as $key => $value)
										<li class="mjs-nestedSortable-leaf" id="menuItem_{{$value->id}}">
											<div class="menuDiv" style="{{$value->status == 0 ? 'background:#d08585;' : ''}}">
													<span data-id="{{$value->id}}" class="itemTitle">{{$value->name}} <i>(url : <a href="{{$value->url}}" target="_blank">{{$value->url}}</a>)</i></span>
													@can('menu-delete')
														<button style="float: right;" class="btn btn-sm btn-danger" onclick="Delete({{$value->id}})">Delete</button>
													@endcan
													@can('menu-edit')
													<a href="{{ route('menus.edit',$value->id) }}" style="float: right; margin-right:2px;" class="btn btn-sm btn-primary" onclick="Edit({{$value->id}})">Edit</a>
													@endcan
												<div id="menuEdit{{$value->id}}" class="menuEdit" style="margin-top:13px;">
													<p>
														{{$value->description}}
													</p>
												</div>
											</div>
											<ol class="sortable ui-sortable mjs-nestedSortable-branch mjs-nestedSortable-expanded">
												@foreach ($child->where('id_parent', $value->id) as $key => $v)
															<li class="mjs-nestedSortable-leaf" id="menuItem_{{$v->id}}">
																<div class="menuDiv" style="{{$v->status == 0 ? 'background:#d08585;' : ''}}">
																		<span data-id="{{$v->id}}" class="itemTitle">{{$v->name}} <i>(url : <a href="{{$v->url}}" target="_blank">{{$v->url}}</a>)</i></span>
																		@can('menu-delete')
																			<button style="float: right;" class="btn btn-sm btn-danger" onclick="Delete({{$v->id}})">Delete</button>
																		@endcan
																		@can('menu-edit')
																			<a href="{{ route('menus.edit',$v->id) }}" style="float: right; margin-right:2px;" class="btn btn-sm btn-primary" onclick="Edit({{$v->id}})">Edit</a>
																		@endcan
																	<div id="menuEdit{{$v->id}}" class="menuEdit" style="margin-top:13px;">
																		<p>
																			{{$v->description}}
																		</p>
																	</div>
																</div>
																<ol class="sortable ui-sortable mjs-nestedSortable-branch mjs-nestedSortable-expanded">
																	@foreach ($child->where('id_parent', $v->id) as $key => $var)
																				<li class="mjs-nestedSortable-leaf" id="menuItem_{{$var->id}}">
																					<div class="menuDiv" style="{{$var->status == 0 ? 'background:#d08585;' : ''}}">
																							<span data-id="{{$var->id}}" class="itemTitle">{{$var->name}} <i>(url : <a href="{{$var->url}}" target="_blank">{{$var->url}}</a>)</i></span>
																							@can('menu-delete')
																								<button style="float: right;" class="btn btn-sm btn-danger" onclick="Delete({{$var->id}})">Delete</button>
																							@endcan
																							@can('menu-edit')
																								<a href="{{ route('menus.edit',$var->id) }}" style="float: right; margin-right:2px;" class="btn btn-sm btn-primary" onclick="Edit({{$var->id}})">Edit</a>
																							@endcan
																						<div id="menuEdit{{$var->id}}" class="menuEdit" style="margin-top:13px;">
																							<p>
																								{{$var->description}}
																							</p>
																						</div>
																					</div>
																				</li>
																	@endforeach
																</ol>

															</li>
													@endforeach
												</ol>

										</li>
								@endforeach
							</ol>
					</li>
			@endforeach
	    </ol>
		<p><br>
		@can('menu-edit')
        <div class="pull-right">
			<input id="toArray" name="toArray" class="btn btn-primary" type="submit" value="Submit">
		</div>
		@endcan
	</section><!-- END #demo -->
	@endsection

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<link href="{{ asset('/css/backend/nestedmenu/nested_custom.css') }}" rel="stylesheet"/>

@push('scripts')
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/nestedSortable/2.0.0/jquery.mjs.nestedSortable.js"></script>
<script src="{{ asset('/js/backend/nestedmenu/nested_custom.js') }}" type="text/javascript" async></script>

<script>
	$(document).ready(function() {
		$().ready(function(){
			var ns = $('ol.sortable').nestedSortable({
				forcePlaceholderSize: true,
				handle: 'div',
				helper:	'clone',
				items: 'li',
				opacity: .6,
				placeholder: 'placeholder',
				revert: 250,
				tabSize: 25,
				tolerance: 'pointer',
				toleranceElement: '> div',
				maxLevels: 4,
				isTree: true,
				expandOnHover: 700,
				startCollapsed: false,
				excludeRoot: true,
				rootID:"root"
			});
			
			$('.expandEditor').attr('title','Click to show/hide item editor');
			$('.disclose').attr('title','Click to show/hide children');
			$('.deleteMenu').attr('title', 'Click to delete item.');
		
			$('.disclose').on('click', function() {
				$(this).closest('li').toggleClass('mjs-nestedSortable-collapsed').toggleClass('mjs-nestedSortable-expanded');
				$(this).toggleClass('ui-icon-plusthick').toggleClass('ui-icon-minusthick');
			});
			
			$('.expandEditor, .itemTitle').click(function(){
				var id = $(this).attr('data-id');
				$('#menuEdit'+id).toggle();
				$(this).toggleClass('ui-icon-triangle-1-n').toggleClass('ui-icon-triangle-1-s');
			});
			
					
			$('#toArray').click(function(e){
				arraied = $('ol.sortable').nestedSortable('toArray', {startDepthCount: 0});
				e.preventDefault();
				$.ajaxSetup({
					headers: {
						'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
					}
				});
				jQuery.ajax({
					url: "{{ url('/administrator/menus/ajaxSave') }}",
					method: 'post',
					data: {
						"data": arraied,
						"_token": "{{ csrf_token() }}",
					},
					success: function(result){
						if(result.status == 200){
							var notif = '<div class="alert alert-success">'+
								'<p>Menu updated successfully</p>'+
								'</div>';
								
							}else{
								var notif = '<div class="alert alert-danger">'+
									'<p>Menu updated failed</p>'+
									'</div>';
									
								}
								
						$('#notif').css('display', 'block');
						$('#notif').html(notif);
					}
				});
			});
		});	
		
	} );

	function DeleteMenu(a) {
		var id = $(a).attr('data-id');
		e.preventDefault();
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
			}
		});
		jQuery.ajax({
			url: "{{ url('/administrator/menus/ajaxSave') }}",
			method: 'post',
			data: {
				"data": arraied,
				"_token": "{{ csrf_token() }}",
			},
			success: function(result){
				alert("sukses")
			}
		});
		//$('#menuItem_'+id).remove();
	}


</script>

<script>
	function Edit(a){
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
			}
		});
		jQuery.ajax({
			url: "{{ url('/administrator/menus/ajaxEdit') }}",
			method: 'post',
			data: {
				"id": a,
				"_token": "{{ csrf_token() }}",
			},
			success: function(result){
				if(result.status == 200){
					var notif = '<div class="alert alert-success">'+
						'<p>Menu updated successfully</p>'+
						'</div>';
						
					}else{
						var notif = '<div class="alert alert-danger">'+
							'<p>Menu updated failed</p>'+
							'</div>';
							
						}
						
				$('#notif').css('display', 'block');
				$('#notif').html(notif);
			}
		});
	}

	function Delete(x){
		var r = confirm("Are you sure ?");
		if (r == true) {
			txt = "You pressed OK!";
					$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
			}
		});
		jQuery.ajax({
			url: "{{ url('/administrator/menus/ajaxDelete') }}",
			method: 'post',
			data: {
				"id": x,
				"_token": "{{ csrf_token() }}",
			},
			success: function(result){
				if(result.status == 200){
					var notif = '<div class="alert alert-success">'+
						'<p>Menu updated successfully</p>'+
						'</div>';
						
					}else{
						var notif = '<div class="alert alert-danger">'+
							'<p>Menu updated failed</p>'+
							'</div>';
							
						}
						
				$('#notif').css('display', 'block');
				$('#notif').html(notif);
				$('#menuItem_'+x).remove();
			}
		});

		} else {
			txt = "You pressed Cancel!";
		}
	}
</script>
@endpush
