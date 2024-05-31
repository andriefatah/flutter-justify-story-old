// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/extensions/int_ext.dart';

// Model Package
class Package {
  final int id;
  final String nama;
  final String gambar;
  final String deskripsi;
  final String harga;
  final String diskon;
  final String hargaAkhir;
  final String categoryName;

  Package({
    required this.id,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.harga,
    required this.diskon,
    required this.hargaAkhir,
    required this.categoryName,
  });
}

// Data dummy untuk Package
List<Package> dummyPackages = [
  Package(
    id: 1,
    nama: "Paket Ulang Tahun Heboh",
    gambar: "http://192.168.1.12:8000/storage/package_image/wedding_2.jpg",
    deskripsi: "Paket foto spesial untuk merayakan ulang tahun dengan gemerlap",
    harga: "500,000.00",
    diskon: "10.00",
    hargaAkhir: "450,000.00",
    categoryName: "Ulang Tahun",
  ),
  Package(
    id: 2,
    nama: "Paket Ulang Tahun Heboh",
    gambar: "http://192.168.1.12:8000/storage/package_image/wedding_2.jpg",
    deskripsi: "Paket foto spesial untuk merayakan ulang tahun dengan gemerlap",
    harga: "500,000.00",
    diskon: "10.00",
    hargaAkhir: "450,000.00",
    categoryName: "Ulang Tahun",
  ),
  Package(
    id: 3,
    nama: "Paket Ulang Tahun Heboh",
    gambar: "http://192.168.1.12:8000/storage/package_image/wedding_2.jpg",
    deskripsi: "Paket foto spesial untuk merayakan ulang tahun dengan gemerlap",
    harga: "500,000.00",
    diskon: "10.00",
    hargaAkhir: "450,000.00",
    categoryName: "Ulang Tahun",
  ),
  // Tambahkan lebih banyak data dummy sesuai dengan contoh yang Anda berikan
];

// Widget PackageCard
class PackageCard extends StatelessWidget {
  final Package package;

  const PackageCard({required this.package});

  @override
  Widget build(BuildContext context) {
    double diskon = package.diskon != null ? double.parse(package.diskon) : 0.0;
    String cleanedPrice = package.harga.replaceAll(',', '');
    int hargaAwal = double.parse(cleanedPrice).round();
    double hargaAkhir = hargaAwal - (hargaAwal * diskon / 100);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                package.gambar,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            // Padding untuk deskripsi produk
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Produk
                  Text(
                    package.nama,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4), // Jar
                  // Kategori
                  Text(
                    package.categoryName,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: AppColors.categoryTextColor,
                    ),
                  ),
                  SizedBox(height: 7), // Jarak antara nama produk dan kategori
                  // Harga Akhir
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hargaAkhir.currencyFormatRp,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: AppColors.priceColor,
                        ),
                      ),
                      // Tambahkan Align untuk menempatkan tombol detail di pojok kanan bawah
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            // Aksi ketika tombol detail ditekan
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.backgroundColor,
                            // Atur lebar tombol detail menjadi 69
                            minimumSize: Size(69, 0),
                          ),
                          child: Text(
                            'Detail',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.buttonTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), // Jarak antara harga dan diskon
                  // Diskon
                  Text(
                    'Diskon: ${diskon.toStringAsFixed(0)}% dari ${hargaAwal.currencyFormatRp}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      color: AppColors.dangerColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
