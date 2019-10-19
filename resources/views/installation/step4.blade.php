 @extends('frontend.layouts.main')
@section('title')
Home
@endsection
 @section('content')
 <div class="col-md-12">
   @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
     <h2 style="margin-top:50px;margin-bottom:10px; text-align:center;">
        Langkah 3 penginstalan
     </h2>
     <div class="card" style="width: 100%;">
      <div class="card-body">
        <h5 class="card-title" style="text-align:center;">Aplikasi ISA (Inventory System Apotek) v.1.0</h5>
        <p>Instalasi Software ISA telah sukses</p>
     
      </div>
    </div>
 </div>
 @include('frontend.layouts.login')    
 @endsection
 @push('scripts')
<script>
</script>
@endpush
 