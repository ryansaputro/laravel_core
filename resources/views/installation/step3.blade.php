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
        <p>Lengkapi Data Diri Anda</p>
        {!! Form::open(array('route' => 'step3','method'=>'POST')) !!}
           <div class="form-group">
            <label for="kode">Kode Apotek</label>
            <input type="text" class="form-control" id="kode" placeholder="Masukkan kode apotek" name="kode">
          </div>
           <div class="form-group">
            <label for="nama">Nama Apotek</label>
            <input type="text" class="form-control" id="nama" placeholder="Masukkan nama apotek" name="nama">
          </div>
          <div class="form-group">
            <label for="telepon">Telepon</label>
            <input type="text" class="form-control" id="telepon" placeholder="Masukkan telepon apotek" name="telepon">
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" placeholder="Masukkan email apotek" name="email">
          </div>
          <div class="form-group">
            <label for="alamat">Alamat</label>
            <input type="text" class="form-control" id="alamat" placeholder="Masukkan alamat apotek" name="alamat">
          </div>
          <div class="form-group">
            <label for="noreg">Nomor Registrasi</label>
            <input type="text" class="form-control" id="noreg" placeholder="Masukkan noreg apotek" name="noreg">
          </div>
          <div class="form-group">
            <label for="penanggung_jawab">Penanggung Jawab</label>
            <input type="text" class="form-control" id="penanggung_jawab" placeholder="Masukkan penanggung jawab apotek" name="penanggung_jawab">
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
 