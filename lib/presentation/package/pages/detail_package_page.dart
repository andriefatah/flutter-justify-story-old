import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/extensions/int_ext.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/package_response_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/booking_page.dart';

class DetailPackage extends StatelessWidget {
  final PackageResponseModel package;
  final double hargaAkhir;

  const DetailPackage({
    super.key,
    required this.package,
    required this.hargaAkhir,
  });

  @override
  Widget build(BuildContext context) {
    double diskon =
        package.diskon != null ? double.parse(package.diskon!) : 0.0;
    String cleanedPrice = package.harga?.replaceAll(',', '') ?? '0';
    double hargaAwal = double.parse(cleanedPrice);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: package.gambar != null
                  ? Image.network(
                      package.gambar!,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.4,
                    )
                  : const SizedBox(height: 200, child: Placeholder()),
            ),
            buttonArrow(context),
            scroll(context, hargaAwal, diskon),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Harga Paket',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    hargaAkhir.currencyFormatRp,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.priceColor,
                    ),
                  ),
                ],
              ),
              Button.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BookingPage(package: package, hargaAkhir: hargaAkhir),
                    ),
                  );
                },
                label: 'Buat Jadwal',
                width: MediaQuery.of(context).size.width * 0.4,
                height: 45.0,
                borderRadius: 8,
                fontSize: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget scroll(BuildContext context, double hargaAwal, double diskon) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                Text(
                  package.nama ?? 'Nama Paket',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  package.categoryName ?? 'Nama Paket',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.categoryTextColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Deskripsi',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Html(
                  data: package.deskripsi ?? 'Tidak ada deskripsi.',
                  style: {
                    "html": Style(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  },
                ),
                const SizedBox(height: 16),
                if (diskon.toInt() > 0 && diskon.toInt() >= 5)
                  Text(
                    'Diskon ${diskon.toInt()}% dari harga awal ${hargaAwal.currencyFormatRp}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
