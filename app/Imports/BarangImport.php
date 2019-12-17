<?php

namespace App\Imports;

use App\Model\Backend\Barang;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow; //TAMBAHKAN CODE INI
use Auth;
use DB;

class BarangImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $satuan = DB::table('hd_barang_satuan')->select('id_satuan')->where('kode_satuan', 'LIKE', '%'.$row['kode_satuan'].'%')->value('id_satuan');
        $golongan = DB::table('hd_barang_golongan')->select('id_golongan_barang')->where('kode_golongan', 'LIKE', '%'.$row['kode_golongan_barang'].'%')->value('id_golongan_barang');
        $jenis = DB::table('hd_barang_jenis')->select('id_jenis_barang')->where('kode_jenis_barang', 'LIKE', '%'.$row['kode_jenis_barang'].'%')->value('id_jenis_barang');
        return new Barang([
            'kode_barang' => $row['kode_barang'],
            'nama_barang' => $row['nama_barang'],
            'stock_minimal' => $row['stock_minimal'],
            'id_satuan' => $satuan,
            'id_golongan_barang' => $golongan,
            'id_jenis_barang' => $jenis,
            'deskripsi' => $row['deskripsi'],
            'dibuat_oleh' => Auth::user()->id,
        ]);
    }
}
