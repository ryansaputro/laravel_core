        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">@yield('title')</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            @yield('new')
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="">
                               <p>{{Auth::user()->name}}</p>
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('logout') }}"  onclick="event.preventDefault(); document.getElementById('logout-forms').submit();">
                                <p>Log out</p>
                                <form id="logout-forms" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                </form>
                            </a>
                        </li>
						<li class="separator hidden-lg"></li>
                    </ul>
                </div>
            </div>
        </nav>

