// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/user_detail/user_detail_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/pages/setting_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/gallery/bloc/gallery_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/gallery/pages/gallery_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/package/package_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/pages/home_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/history_bookings/history_bookings_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/pages/all_transaction_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  final int currentIndex;

  MainPage({this.currentIndex = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  List<Widget> pages = [
    const HomePage(),
    const GalleryPage(),
    const AllTransactionPage(),
    SettingPage(),
  ];

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onTapBottomNavigation(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 0) {
      context.read<UserDetailBloc>().add(const UserDetailEvent.getUserDetail());
      context.read<PackageBloc>().add(const PackageEvent.getPackage());
    }

    if (index == 1) {
      context.read<GalleryBloc>().add(const GalleryEvent.getGalleries());
    }

    if (index == 2) {
      context
          .read<HistoryBookingsBloc>()
          .add(const HistoryBookingsEvent.getHistoryBookings());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'Montserrat',
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
          ),
          currentIndex: currentIndex,
          onTap: onTapBottomNavigation,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: currentIndex == 3
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/gallery.svg',
                color: currentIndex == 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
              ),
              label: 'Galeri',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/transaction.svg',
                color: currentIndex == 2
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
              ),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user.svg',
                color: currentIndex == 3
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
              ),
              label: 'Pengguna',
            ),
          ],
        ),
      ),
    );
  }
}
