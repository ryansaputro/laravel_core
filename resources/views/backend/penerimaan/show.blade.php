@extends('backend.layouts.main')
@section('title')
Detail
@endsection
@section('new')
@endsection
@section('content')
<style>
	.riwayat:hover{
		color: #a99342;
	}
	.borderless td, .borderless tr {
		border: none;
	}
</style>
	@if ($message = Session::get('success'))
		<div class="alert alert-success">
			<p>{{ $message }}</p>
		</div>
	@elseif ($message = Session::get('danger'))
		<div class="alert alert-danger">
			<p>{{ $message }}</p>
		</div>
	@endif
	
	<div  id='DivIdToPrint' class="col-sm-12" style="border:1px solid black; height:max-content;">
		<div style="height: 100px;background:black; margin-left: -15px;margin-right: -15px;">
			<h3 style="float:right;color: #fff;padding-right: 25px;padding-top: 5px;">FORM PENERIMAAN</h3>
		</div>
		<div>
			<table class="table borderless">
				<tr>
					<td>No. Pemesanan</td>
					<td>{{$data->no_pemesanan}}</td>
					<td>No Penerimaan</td>
					<td>{{$dataPenerima->no_penerimaan}}</td>
				</tr>
				<tr>
					<td>Tanggal Pemesanan</td>
					<td>{{$data->dibuat_tgl}}</td>
					<td>Tanggal Penerimaan</td>
					<td>{{$dataPenerima->tanggal_penerimaan}}</td>
				</tr>
				<tr>
					<td>Vendor</td>
					<td>{{$data->nama_vendor}}</td>
					<td>No Faktur</td>
					<td>{{$dataPenerima->no_faktur}}</td>
				</tr>
			</table>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama Barang</th>
						<th>Jumlah</th>
						<th>Satuan</th>
						<th>Harga</th>
						<th>Ket.</th>
					</tr>
				</thead>
				<tbody>
					@php
						$tot = 0;	
						$bln =  date("n", strtotime($data->dibuat_tgl));
						$day =  date("d", strtotime($data->dibuat_tgl));
						$year =  date("Y", strtotime($data->dibuat_tgl));
					@endphp
					@foreach ($item as $k => $v)
					@php
						$tot += $v->harga*$v->qty; 	
					@endphp
					<tr>
						<td>{{$k+1}}</td>
						<td>{{$v->nama_barang}}</td>
						<td>{{number_format($v->qty, 0, '.', '.')}} x @ Rp. {{number_format($v->harga, 0, '.', '.')}}</td>
						<td>{{$v->nama_satuan}}</td>
						<td style="text-align: right;">Rp. {{number_format($v->harga*$v->qty, 0, '.', '.')}}</td>
						<td>{{$v->keterangan}}</td>
					</tr>
					@endforeach
					<tr>
						<th colspan="4" style="text-align: right;">Total</th>
						<th style="text-align: right;">Rp. {{number_format($tot, 0, '.', '.')}}</th>
						<th></th>
					</tr>
				</tbody>
			</table>
			<strong>Terbilang : {{ucwords(Terbilang::make($tot, ' rupiah'))}}</strong>
			<p>Catatan:{{$dataPenerima->catatan}}</p>
			<p style="float:right;">{{$apotek->alamat}}, {{$day}} {{App\Helpers\Bulan::get_name($bln)}} {{$year}}
				<br>
				<br>
				{{$dataPenerima->name}}</p>
		</div>
	</div>
	<div class="row">
	    <div style="margin-top:10px;" class="col-lg-12 margin-tb">
	        <div class="pull-right">
				<a class="btn btn-primary" href="{{ route('penerimaan.index') }}"> Batalkan</a>
				<input type='button' id='btn' class="btn btn-primary" value='Print' onclick='printDiv();'>
	        </div>
	    </div>
	</div>

@endsection

@push('scripts')
<script>
function printDiv() 
{

	
	var divToPrint=document.getElementById('DivIdToPrint');

	var newWin=window.open('','Print-Window');
	var myStyle = '<link rel="stylesheet" href="http://127.0.0.1:8000/css/backend/bootstrap.min.css" />';

	newWin.document.open();

	newWin.document.write(myStyle+'<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

	newWin.document.close();

	setTimeout(function(){newWin.close();},10);

}
</script>

@endpush
