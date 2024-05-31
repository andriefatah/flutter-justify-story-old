// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/about_me_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/banner_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/booking_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/category_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/coupon_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/feedback_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/gallery_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/package_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/payment_method_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/payment_proof_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/schedule_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/user_detail_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/about_me/about_me_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/feedback/feedback_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/user_detail/user_detail_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/pages/about_me_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/pages/setting_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/pages/register_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/pages/splash_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/bloc/add_booking/add_booking_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/bloc/apply_coupon/apply_coupon_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/booking/bloc/check_schedule/check_schedule_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/gallery/bloc/gallery_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/gallery/pages/gallery_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/banner/banner_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/category/category_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/package/package_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/main_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/payment_method/payment_method_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/history_bookings/history_bookings_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/payment_proof/payment_proof_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ApplyCouponBloc(CouponRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddBookingBloc(BookingRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => FeedbackBloc(FeedbackRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PaymentProofBloc(PaymentProofRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CheckScheduleBloc(ScheduleRemoteDatasource()),
        ),
        BlocProvider<UserDetailBloc>(
            create: (context) => UserDetailBloc(
                  UserDetailRemoteDatasource(),
                )..add(UserDetailEvent.getUserDetail())),
        BlocProvider<PaymentMethodBloc>(
            create: (context) => PaymentMethodBloc(
                  PaymentMethodRemoteDatasource(),
                )..add(PaymentMethodEvent.getPaymentMethods())),
        BlocProvider<HistoryBookingsBloc>(
            create: (context) => HistoryBookingsBloc(
                  BookingRemoteDataSource(),
                )..add(HistoryBookingsEvent.getHistoryBookings())),
        BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(
                  CategoryRemoteDatasource(),
                )..add(CategoryEvent.started())),
        BlocProvider<GalleryBloc>(
            create: (context) => GalleryBloc(
                  GalleryRemoteDatasource(),
                )..add(GalleryEvent.started())),
        BlocProvider<BannerBloc>(
            create: (context) => BannerBloc(
                  BannerRemoteDatasource(),
                )..add(BannerEvent.started())),
        BlocProvider<AboutMeBloc>(
            create: (context) => AboutMeBloc(
                  AboutMeRemoteDataSource(),
                )..add(AboutMeEvent.started())),
        BlocProvider(
          create: (context) => PackageBloc(PackageRemoteDatasource())
            ..add(PackageEvent.getPackage()),
        ),
      ],
      child: MaterialApp(
        title: 'Justify Story',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.wait([
            AuthLocalDataSource().isUserLoggedIn(),
            Future.delayed(Duration(seconds: 3)),
          ]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final isLoggedIn = snapshot.data?[0] ?? false;
            if (isLoggedIn) {
              return MainPage();
            }
            return SplashPage();
          },
        ),
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => HomePage(),
          '/gallery': (context) => GalleryPage(),
          '/setting': (context) => SettingPage(),
          '/about-me': (context) => AboutMePage(),
        },
      ),
    );
  }
}
