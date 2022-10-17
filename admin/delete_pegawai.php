<?php
include "../database/koneksi.php";
$id = $_GET['id_pegawai'];

$select = "SELECT nip from pegawai where id_pegawai='$id'";
$query = mysqli_query($koneksi, $select);
$row = mysqli_fetch_array($query);
$nip = $row['nip'];

$deleteuser = mysqli_query($koneksi, "DELETE FROM user WHERE nip='$nip'");

$deletecuti = mysqli_query($koneksi, "DELETE FROM cuti_pegawai WHERE id_cutipegawai='$id'");

$deletepegawai = mysqli_query($koneksi, "DELETE FROM pegawai WHERE id_pegawai='$id'");

if ($deletecuti && $deleteuser && $deletepegawai) {
  echo "<script>alert('Berhasil Dihapus'); document.location='index.php?page=data_pegawai';</script>";
} else {
  echo "<script>alert('Gagal Dihapus'); document.location='index.php?page=data_pegawai';</script>";
}
