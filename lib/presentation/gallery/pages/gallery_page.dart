import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/gallery/bloc/gallery_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/gallery/pages/detail_gallery_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/main_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    context.read<GalleryBloc>().add(const GalleryEvent.refreshGalleries());
    _startPeriodicUpdate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startPeriodicUpdate() {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      context.read<GalleryBloc>().add(const GalleryEvent.refreshGalleries());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Galeri',
        onBackButtonPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            return state.maybeMap(
              initial: (_) => const Center(child: Text('Please wait...')),
              loadInProgress: (_) =>
                  const Center(child: CircularProgressIndicator()),
              loadSuccess: (successState) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: successState.galleries.length,
                  itemBuilder: (BuildContext context, int index) {
                    final gallery = successState.galleries[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailGalleryPage(galleryItem: gallery),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          gallery.thumbnail ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(1),
                  mainAxisSpacing: 7.0,
                  crossAxisSpacing: 7.0,
                );
              },
              loadFailure: (failureState) =>
                  Center(child: Text('Error: ${failureState.error}')),
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
