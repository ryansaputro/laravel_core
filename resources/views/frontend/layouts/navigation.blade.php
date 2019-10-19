 <?php
if(isset(Auth::user()->id)) :
 $menusPrimary = DB::table('menus')->select('*')->where('menu_role', '<>', '17')->where('status', '1')->where('id_parent', '0')->get();
 $menusSekundery = DB::table('menus')->select('*')->where('menu_role', '<>', '17')->where('status', '1')->get();
    $url = url()->current();
    $explode = explode('/', $url);
    $explode[3] = !empty($explode[3]) ? '/'.$explode[3] : '/';
 ?>
 <!-- Navigation -->
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="background: #1869b9!important;">
   <div class="container">
     <a class="navbar-brand" href="/">{{config('app.name')}}</a>
     <input type="text" name="search" class="form-control" placeholder="pencarian" style="width:45%;">
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            @foreach ($menusPrimary as $key => $item)
                @if (count($menusSekundery->where('id_parent', $item->id)) == 0)
                    <li class="nav-item {{$explode[3] == $item->url ? 'active' : ''}}">
                        <a class="nav-link" href="{{$item->url}}">{{$item->name}}
                        </a>
                    </li>
                @else
                    @foreach($menusSekundery->where('id_parent', $item->id) AS $k => $v)
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ $item->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{$v->url}}">
                                        {{$v->name }}
                                    </a>
                                </div>
                            </li>
                    @endforeach
                @endif
            @endforeach
          <li class="nav-item">
            @if (Route::has('login'))
                  <div class="top-right links">
                      @auth
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ URL::to('/users') }}">
                                        {{ __('Pengaturan') }}
                                    </a>

                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-forms').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-forms" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest

                      @else
                          <a href="" class="nav-link" data-toggle="modal" data-target="#modalLoginForm">Login</a>
                          {{-- @if (Route::has('register'))
                              <a href="{{ route('register') }}">Register</a>
                          @endif --}}
                      @endauth
                  </div>
              @endif
            </li>
        </ul>
      </div>
    </div>
  </nav>
  <?php
  endif;