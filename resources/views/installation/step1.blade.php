 @extends('frontend.layouts.main')
@section('title')
Home
@endsection
 @section('content')
 <div class="col-md-12">
     <h2 style="margin-top:50px;margin-bottom:10px;text-align:center;">
        Langkah 1 penginstalan
     </h2>
     <div class="card" style="width: 100%;">
      <div class="card-body">
        <h5 class="card-title" style="text-align:center;">Aplikasi ISA (Inventory System Apotek) v.1.0</h5>
        <p class="card-text">
            Anda diharuskan membuat suatu "Database" baru.
        </p>
        <a href="{{URL::to('/step-2')}}" class="btn btn-primary">Selanjutnya</a>
      </div>
    </div>
 </div>
 @include('frontend.layouts.login')    
 @endsection
 @push('scripts')
<script>
</script>
@endpush
 