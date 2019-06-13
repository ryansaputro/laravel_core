<?php
$menus = DB::table('menus')->select('*')->where('menu_role', '17')->where('status', '1')->orderBy('order', 'ASC')->get();
    $url = url()->current();
    $explode = explode('/', $url);
    $active = "/".$explode[3]."/".$explode[4];
?>
<style>
    /* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}

.dropdown-btn {
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}
</style>
<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    {{config('app.name')}}
                </a>
            </div>
            @foreach ($menus as $item)
                @php
                    $parent_id[$item->id] = $item->id_parent; 
                    $name[$item->id_parent] = $item->name; 
                @endphp
            @endforeach
                <ul class="nav">
                @foreach ($menus as $key => $val)
                    @if ($val->id_parent == 0)
                        <li class="{{in_array($val->id, $parent_id) ? 'dropdown-btn' : ''}} {{$active == $val->url ? 'active' : ''}}">
                            <a href="{{$val->url}}" class="{{in_array($val->id, $parent_id) ? 'dropdown-toggle' : ''}}" data-toggle="{{in_array($val->id, $parent_id) ? 'dropdown' : ''}}" aria-expanded="false">
                                <i class="{{in_array($val->id, $parent_id) ? 'fa fa-caret-down' : $val->icon}}"></i>
                                <p>{{$val->name}}</p>
                            </a>
                            @if (in_array($val->id, $parent_id))
                                <ul class="dropdown-container" style="margin-left:10px; background:#26262600;">
                                    @php
                                        $child = DB::table('menus')->select('*')->where('id_parent', $val->id)->orderBy('order', 'ASC')->get();
                                    @endphp
                                        @foreach ($child as $item)
                                            <li class="child {{$active == $item->url ? 'active' : ''}}">
                                                <a href="{{$item->url}}" class="{{in_array($item->id, $parent_id) ? 'dropdown-toggle' : ''}}" data-toggle="{{in_array($item->id, $parent_id) ? 'dropdown' : ''}}" aria-expanded="false">
                                                    <i class="{{in_array($item->id, $parent_id) ? 'fa fa-caret-down' : $item->icon}}"></i>
                                                    <p>{{$item->name}}</p>
                                                </a>
                                            </li>
                                        @endforeach
                                </ul>
                            @endif
                        </li>
                    
                    @endif
                @endforeach
            </ul>
                @include('backend.layouts.footer')
        </div>
@push('scripts')
    <script>
        $('a.dropdown-toggle').on('click', function(){
            if($('.dropdown-btn').hasClass('open') == false){
                $('.dropdown-container').css('display', 'block');
            }else{
                $('.dropdown-container').css('display', 'none');
            }
        })

        $(document).ready(function(){
            if($('.child').hasClass('active') == true){
                $('.dropdown-container').css('display', 'block');
            }
        })
    </script>
    
@endpush
