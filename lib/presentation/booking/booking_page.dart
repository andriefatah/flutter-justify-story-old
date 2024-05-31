// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/extensions/int_ext.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/create_booking_reqeust_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/package_response_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/bloc/add_booking/add_booking_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/bloc/apply_coupon/apply_coupon_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/bloc/check_schedule/check_schedule_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/fail_booking_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/success_booking_page.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  final PackageResponseModel package;
  final double hargaAkhir;

  const BookingPage(
      {super.key, required this.package, required this.hargaAkhir});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool _isCouponApplied = false;
  late double _hargaAkhir;
  late double _initialHargaAkhir;
  String _previouslySelectedDate = '';
  String _tanggalJamFoto = '';

  @override
  void initState() {
    super.initState();
    _hargaAkhir = widget.hargaAkhir;
    _initialHargaAkhir = widget.hargaAkhir;
  }

  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jamController = TextEditingController();
  final TextEditingController tanggalJamController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();
  final TextEditingController kuponController = TextEditingController();
  final TextEditingController namaPemesanController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();

  void _applyCoupon(BuildContext context) {
    int hargaAkhirInt = _hargaAkhir.toInt();
    BlocProvider.of<ApplyCouponBloc>(context).add(
      ApplyCouponEvent.applyCoupon(
        kuponController.text,
        hargaAkhirInt,
      ),
    );
  }

  void _cancelCoupon() {
    setState(() {
      _hargaAkhir = _initialHargaAkhir;
      _isCouponApplied = false;
      kuponController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Buat Booking',
        backgroundColor: AppColors.appBarBackgroundColor,
        textColor: AppColors.appBarTextColor,
        iconColor: AppColors.appBarIconColor,
        statusBarBrightness: Brightness.dark,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    widget.package.gambar ?? '',
                                    width: 140,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.package.nama ?? 'Nama Paket',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        widget.package.categoryName ??
                                            'Kategori',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Detail Pesanan',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.headingColor),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Tanggal Foto',
                              style: TextStyle(
                                color: AppColors.headingColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10),
                            BlocListener<CheckScheduleBloc, CheckScheduleState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  success: (message) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(message),
                                        backgroundColor: AppColors.successColor,
                                      ),
                                    );
                                  },
                                  failure: (errorMessage) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(errorMessage),
                                        backgroundColor: AppColors.dangerColor,
                                      ),
                                    );

                                    setState(() {
                                      tanggalController.clear();
                                      jamController.clear();
                                    });
                                  },
                                  orElse: () {},
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.textfieldBackgroundColor,
                                    ),
                                    child: TextFormField(
                                      controller: tanggalController,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        hintText: 'Pilih Tanggal',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0,
                                          horizontal: 15.0,
                                        ),
                                        prefixIcon: Icon(Icons.calendar_today),
                                      ),
                                      onTap: () async {
                                        final DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime(DateTime.now().year + 1),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            final String newDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            if (newDate !=
                                                _previouslySelectedDate) {
                                              _previouslySelectedDate = newDate;
                                              jamController.clear();
                                            }
                                            tanggalController.text = newDate;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: [
                                      '06:00',
                                      '07:00',
                                      '08:00',
                                      '09:00',
                                      '10:00',
                                      '11:00',
                                      '12:00',
                                      '13:00',
                                      '14:00',
                                      '15:00',
                                      '16:00',
                                      '17:00',
                                      '18:00',
                                      '19:00',
                                      '20:00',
                                    ].map((time) {
                                      return ChoiceChip(
                                        label: Text(
                                          time,
                                          style: TextStyle(
                                            color: jamController.text == time
                                                ? Colors.white
                                                : AppColors
                                                    .buttonBackgroundColor,
                                          ),
                                        ),
                                        selectedColor:
                                            AppColors.buttonBackgroundColor,
                                        backgroundColor: Colors.white,
                                        selected: jamController.text == time,
                                        onSelected: (selected) {
                                          if (selected) {
                                            setState(() {
                                              jamController.text = time;
                                              _updateTanggalJamFoto();
                                              if (tanggalController
                                                  .text.isNotEmpty) {
                                                context
                                                    .read<CheckScheduleBloc>()
                                                    .add(
                                                      CheckScheduleEvent
                                                          .checkSchedule(
                                                        _tanggalJamFoto,
                                                      ),
                                                    );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Harap pilih tanggal terlebih dahulu'),
                                                    backgroundColor:
                                                        AppColors.dangerColor,
                                                  ),
                                                );
                                                setState(() {
                                                  jamController.clear();
                                                });
                                              }
                                            });
                                          }
                                        },
                                        checkmarkColor:
                                            jamController.text == time
                                                ? Colors.white
                                                : Colors.black,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('Catatan Tambahan'),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 120.0,
                              decoration: const BoxDecoration(
                                color: AppColors.textfieldBackgroundColor,
                              ),
                              child: TextFormField(
                                controller: catatanController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan catatan tambahan di sini',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Detail Pemesan',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.headingColor),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Nama Pemesan',
                              style: TextStyle(
                                  color: AppColors.headingColor,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.textfieldBackgroundColor,
                              ),
                              child: TextFormField(
                                controller: namaPemesanController,
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan Nama Pemesan',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Lokasi',
                              style: TextStyle(
                                  color: AppColors.headingColor,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.textfieldBackgroundColor,
                              ),
                              child: TextFormField(
                                controller: lokasiController,
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan Lokasi',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'No HP',
                              style: TextStyle(
                                  color: AppColors.headingColor,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.textfieldBackgroundColor,
                              ),
                              child: TextFormField(
                                controller: noHpController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan No HP',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<ApplyCouponBloc, ApplyCouponState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (message, totalPembayaranBaru) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                backgroundColor: AppColors.successColor,
                              ),
                            );
                            setState(() {
                              _hargaAkhir = totalPembayaranBaru?.toDouble() ??
                                  _hargaAkhir;
                              _isCouponApplied = true;
                            });
                          },
                          error: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                backgroundColor: AppColors.dangerColor,
                              ),
                            );
                          },
                          orElse: () {},
                        );
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Pembayaran',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      _hargaAkhir.currencyFormatRp,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.priceColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (!_isCouponApplied)
                              Container(
                                width: MediaQuery.of(context).size.width - 32,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Punya kupon? Masukkan kesini:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: AppColors
                                              .textfieldBackgroundColor,
                                        ),
                                        child: TextFormField(
                                          controller: kuponController,
                                          decoration: const InputDecoration(
                                            hintText: 'Masukkan Kode Kupon',
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 20.0,
                                              horizontal: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Button.filled(
                                        onPressed: () {
                                          _applyCoupon(context);
                                        },
                                        label: 'Terapkan',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (_isCouponApplied)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Button.outlined(
                                  onPressed: _cancelCoupon,
                                  label: 'Batalkan Kupon',
                                ),
                              ),
                            const SizedBox(height: 50),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            BlocConsumer<AddBookingBloc, AddBookingState>(
              listener: (context, state) {
                state.when(
                  initial: () {},
                  loading: () {},
                  success: (message) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            SuccessBookingPage(message: message),
                      ),
                    );
                  },
                  error: (message) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => FailBookingPage(message: message),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return Button.filled(
                    onPressed: () async {
                      final authData = await _authLocalDataSource.getAuthData();
                      if (catatanController.text.trim().isEmpty ||
                          namaPemesanController.text.trim().isEmpty ||
                          lokasiController.text.trim().isEmpty ||
                          noHpController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Semua kolom wajib diisi!',
                            ),
                          ),
                        );
                      } else {
                        final int hargaAkhirInt = _hargaAkhir.toInt();

                        final DateTime tanggalJamFoto =
                            DateFormat('yyyy-MM-dd HH:mm')
                                .parse(_tanggalJamFoto);

                        final request = CreateBookingRequestModel(
                          jumlahTotal: hargaAkhirInt,
                          jumlahDibayar: 0,
                          sisaPiutang: hargaAkhirInt,
                          statusPembayaran: 'menunggu konfirmasi',
                          packageId: widget.package.id,
                          userId: authData?.user!.id!,
                          tanggalJamFoto: tanggalJamFoto,
                          namaPemesan: namaPemesanController.text,
                          lokasi: lokasiController.text,
                          noHp: noHpController.text,
                          catatan: catatanController.text,
                          statusBooking: 'menunggu konfirmasi',
                        );

                        context.read<AddBookingBloc>().add(
                              AddBookingEvent.booking(request),
                            );
                      }
                    },
                    label: 'Booking',
                    width: MediaQuery.of(context).size.width,
                    height: 45.0,
                    borderRadius: 15,
                    fontSize: 16.0,
                  );
                }, loading: () {
                  return const Center(child: CircularProgressIndicator());
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateTanggalJamFoto() {
    if (tanggalController.text.isNotEmpty && jamController.text.isNotEmpty) {
      setState(() {
        _tanggalJamFoto = '${tanggalController.text} ${jamController.text}';
      });
    }
  }
}
