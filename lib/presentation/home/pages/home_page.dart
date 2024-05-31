// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/auth_response_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/user_detail/user_detail_bloc.dart';

import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/banner/banner_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/widgets/list_category.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/widgets/list_package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Semua Paket';
  AuthLocalDataSource authLocalDataSource = AuthLocalDataSource();
  AuthResponseModel? authResponse;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    authResponse = await authLocalDataSource.getAuthData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, right: 4, left: 4),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang,',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          BlocBuilder<UserDetailBloc, UserDetailState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () => CircularProgressIndicator(),
                                loading: () =>
                                    Center(child: CircularProgressIndicator()),
                                success: (userDetail) => Text(
                                  userDetail.name ?? 'Null',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.headingColor,
                                  ),
                                ),
                                error: (message) => Text(
                                  'Error: $message',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.headingColor,
                                  ),
                                ),
                                updateSuccess: (message) {
                                  return const SizedBox.shrink();
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Siap untuk mengabadikan momen',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          Text(
                            'spesialmu?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                BlocBuilder<BannerBloc, BannerState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () {
                        return Center(child: Text('Initial State'));
                      },
                      loading: () => Center(child: CircularProgressIndicator()),
                      loaded: (banners) {
                        List<Widget> imageSliders = banners
                            .map((banner) => Image.network(
                                  banner.gambar ?? '',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ))
                            .toList();

                        return Column(
                          children: [
                            CarouselSlider(
                              items: imageSliders,
                              options: CarouselOptions(
                                height: 200,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 500),
                                viewportFraction: 1.0,
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: banners.map((banner) {
                                int index = banners.indexOf(banner);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Color.fromRGBO(0, 0, 0, 0.9)
                                        : Color.fromRGBO(0, 0, 0, 0.4),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      },
                      error: (message) =>
                          Center(child: Text('Error: $message')),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ListCategory(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                ListPackage(selectedCategory: selectedCategory),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
