<?php
include "../database/koneksi.php";
$nip = $_GET['nip'];
$nama = $_GET['pegawai'];
$jabatanpegawai = $_GET['jabatan'];
$golpegawai = $_GET['golongan'];
$sisa_cuti = $_GET['sisa_cuti'];

$query = "UPDATE pegawai SET nama_pegawai='$nama', id_jabatan='$jabatanpegawai', id_golongan='$golpegawai', sisa_cuti='$sisa_cuti' WHERE nip='$nip'";
$hasil = mysqli_query($koneksi, $query);
// echo mysqli_error($koneksi);
if ($hasil) {
  echo "<script>alert('Berhasil Edit'); document.location='index.php?page=data_pegawai';</script>";
} else {
  echo "<script>alert('Gagal Edit'); document.location='index.php?page=data_pegawai';</script>";
}
