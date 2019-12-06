        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header"  style="margin-top:30px;">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">@yield('title')</a>
                </div>
                <div class="collapse navbar-collapse"  style="margin-top:10px;">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            @yield('new')
                        </li>

                        {{--  <li>
                            <a href="#">
                                <img src="https://upload.wikimedia.org/wikipedia/id/8/89/Logo_Apotek_K-24.png" style="width:75px;margin-left:345px;">
                            </a>
                        </li>  --}}
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        {{--  <li>
                           <a href="">
                              <img class="avatar border-gray" style="width:40px;border-radius:50px;" src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/img/faces/face-3.jpg" alt="...">
                            </a>
                        </li>  --}}
                        {{--  <li>
                            <a href="{{ route('logout') }}"  onclick="event.preventDefault(); document.getElementById('logout-forms').submit();">
                                <p>Log out</p>
                                <form id="logout-forms" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                </form>
                            </a>
                        </li>  --}}
                        {{--  <li class="separator hidden-lg"></li>  --}}
                        <li class="dropdown" style="margin-top:10px;">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-lg hidden-md"></b>
									<p class="hidden-lg hidden-md">
										5 Notifications
										<b class="caret"></b>
									</p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <p>
                                       <img class="avatar border-gray" style="width:40px;border-radius:50px;" src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/img/faces/face-3.jpg" alt="..."> 
                                        {{Auth::user()->name}}
										<b class="caret"></b>
									</p>

                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Akun</a></li>
                                <li><a href="#">Riwayat</a></li>
                                <li><a href="#">Tentang</a></li>
                                <li class="divider"></li>
                                <li> <a href="{{ route('logout') }}"  onclick="event.preventDefault(); document.getElementById('logout-forms').submit();">
                                <p>Keluar</p>
                                <form id="logout-forms" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                </form>
                            </a></li>
                              </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

