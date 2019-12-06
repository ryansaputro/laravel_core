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
        Langkah 2 penginstalan
     </h2>
     <div class="card" style="width: 100%;">
      <div class="card-body">
        <h5 class="card-title" style="text-align:center;">Aplikasi ISA (Inventory System Apotek) v.1.0</h5>
        {!! Form::open(array('route' => 'step2','method'=>'POST')) !!}
          <div class="form-group">
            <label for="email">Nama Database</label>
            <input type="text" class="form-control" id="nama" placeholder="Masukkan nama database" name="nama">
          </div>
          <div class="form-group">
            <label for="pwd">Username Database</label>
            <input type="text" class="form-control" id="username" placeholder="Masukkan username database" name="username">
          </div>
          <div class="form-group">
            <label for="pwd">Password Database</label>
            <input type="password" class="form-control" id="password" placeholder="Masukkan password database" name="password">
          </div>
          <button type="submit" class="btn btn-primary">Selanjutnya</button>
      {!! Form::close() !!}
      </div>
    </div>
 </div>
 @include('frontend.layouts.login')    
 @endsection
 @push('scripts')
<script>
</script>
@endpush
 