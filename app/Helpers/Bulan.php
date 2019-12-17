<?php
namespace App\Helpers;

use Illuminate\Support\Facades\DB;

class Bulan
{
    public static function get_name($id)
    {
        $bulan = array("1" => "Januari", "2" => "Febuari", "3" => "Maret", "4" => "April", "5" => "Mei", "6" => "Juni", "7" => "Juli", "8" => "Agustus", "9" => "September", "10" => "Oktober", "11" => "November", "12" => "Desember");
        $data = array_key_exists($id, $bulan) ? $bulan[$id] : '-';
        return $data;
    }
}