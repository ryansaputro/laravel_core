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

/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #7b55bc; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #ab80e0; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
</style>
<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    {{DB::table('hd_data_apotek')->select('nama')->value('nama') == '' ? config('app.name') : DB::table('hd_data_apotek')->select('nama')->value('nama')}}
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
                        <li data-toggle="tooltip" title="{{$val->name}}" class="nav_menu {{in_array($val->id, $parent_id) ? 'dropdown-btn' : ''}} {{$active == $val->url ? 'active' : ''}}">
                            <a href="{{$val->url}}" class="link_menu {{in_array($val->id, $parent_id) ? 'dropdown-toggle' : ''}}" data-toggle="{{in_array($val->id, $parent_id) ? 'dropdown' : ''}}" aria-expanded="false">
                                <i class="icon {{in_array($val->id, $parent_id) ? 'fa fa-caret-down' : $val->icon}}"></i>
                                <p class="nameOfMenu">{{$val->name}}</p>
                            </a>
                            @if (in_array($val->id, $parent_id))
                                <ul class="dropdown-container children" style="margin-left:25px; background:#26262600;">
                                    @php
                                        $child = DB::table('menus')->select('*')->where('id_parent', $val->id)->where('status', '1')->orderBy('order', 'ASC')->get();
                                    @endphp
                                        @foreach ($child as $item)
                                            <li data-toggle="tooltip" title="{{$item->name}}" class="child {{$active == $item->url ? 'active' : ''}}" style="display:block;">
                                                <a href="{{$item->url}}" class="{{in_array($item->id, $parent_id) ? 'dropdown-toggle' : ''}}" data-toggle="{{in_array($item->id, $parent_id) ? 'dropdown' : ''}}" aria-expanded="false">
                                                    <i class="icon-children {{in_array($item->id, $parent_id) ? 'fa fa-caret-down' : $item->icon}}"></i>
                                                    <p class="nameOfMenu">{{$item->name}}</p>
                                                </a>
                                            </li>
                                        @endforeach
                                </ul>
                            @endif
                        </li>
                    
                    @endif
                @endforeach

                {{--  <li class="nav_menu" style="">
                    
                </li>  --}}
            </ul>
                @include('backend.layouts.footer')
        </div>
        
@push('scripts')
    <script>
        $('.nav_menu').on('click', function(){
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


        function hideMenu(a){
            $('p.nameOfMenu').css('display', 'none');
            $('.style').removeClass('fa fa-times');
            $('.style').addClass('fa fa-bars');
            $(a).attr('onclick', 'showMenu(this)');
            $(a).find('.hideMenus').text("");
            $('.sidebar-wrapper').css('width', '110px');
            $('.sidebar').css('width', '110px');
            $('.nav_menu').css('padding-top', '20px');
            $('.main-panel').css('width', 'calc(100% - 110px)');
            $('.icon-children').css('margin-left', '13px');
            $('.icon').css('margin-left', '5px');
            $('.icon-children').css('margin-top', '10px');
            $('.nav').find('li.active').find('a').css('height', '50px');
            $('.nav').find('li').find('a').css('height', '50px');
            $('.children').css('margin-left', '3px');
            $('.children').find('li').find('a').css('padding-left', '0px');
            $('.mainButton').css('margin-left', '65px');
        }
        
        function showMenu(a){
            $('p.nameOfMenu').css('display', 'block');
            $(a).attr('onclick', 'hideMenu(this)');
            $('.mainButton').css('margin-left', '220px');
            $('.style').removeClass('fa fa-bars');
            $('.style').addClass('fa fa-times');
            $('.sidebar').css('width', '260px');
            $('.sidebar-wrapper').css('width', '260px');
            $('.nav_menu').css('padding-top', 'inherit');
            $('.main-panel').css('width', 'calc(100% - 260px)');
            $('.nav').find('li.active').find('a').css('height', 'inherit');
            $('.nav').find('li').find('a').css('height', 'inherit');
            $('.children').css('margin-left', '25px');
            $('.children').find('li').find('a').css('padding-left', 'inherit');
             $('.icon-children').css('margin-left', 'inherit');
             $('.icon-children').css('margin-top', 'inherit');
             $('.icon').css('margin-left', 'inherit');

        }

        
    </script>
    
@endpush
