 @extends('frontend.layouts.main')
@section('title')
Home
@endsection
 @section('content')
 <div class="col-md-12" style="text-align:center;">
     <h2 style="margin-top:50px;margin-bottom:10px;">
        Selamat Datang
     </h2>
     <div class="card" style="width: 100%;">
      <div class="card-body">
        <h5 class="card-title">Aplikasi ISA (Inventory System Apotek) v.1.0</h5>
        <p class="card-text">
            HELLO DIGGI
        </p>
        <a href="{{URL::to('step-1')}}" class="btn btn-primary">Instal</a>
      </div>
    </div>
 </div>
 @include('frontend.layouts.login')    
 @endsection
 @push('scripts')
<script>
</script>
@endpush
 