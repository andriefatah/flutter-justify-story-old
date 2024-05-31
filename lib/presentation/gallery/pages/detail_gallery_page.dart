import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/gallery_response_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailGalleryPage extends StatelessWidget {
  final GalleryResponseModel galleryItem;

  const DetailGalleryPage({super.key, required this.galleryItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                galleryItem.thumbnail ?? '',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            buttonArrow(context),
            scroll(context),
          ],
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

  Widget scroll(BuildContext context) {
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
                const SizedBox(height: 16),
                Text(
                  galleryItem.judul ?? '',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Html(
                  data: galleryItem.deskripsi ?? '',
                  style: {
                    "html": Style(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      PhotoViewGallery.builder(
                        itemCount: galleryItem.media?.length ?? 0,
                        builder: (context, index) {
                          final mediaPath =
                              galleryItem.media?[index].path ?? '';
                          return PhotoViewGalleryPageOptions(
                            imageProvider: NetworkImage(mediaPath),
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            maxScale: PhotoViewComputedScale.covered * 2,
                          );
                        },
                        scrollPhysics: const BouncingScrollPhysics(),
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        loadingBuilder: (context, event) => Center(
                          child: SizedBox(
                            width: 10.0,
                            height: 10.0,
                            child: CircularProgressIndicator(
                              value: event == null
                                  ? 0
                                  : event.cumulativeBytesLoaded /
                                      (event.expectedTotalBytes ?? 1),
                            ),
                          ),
                        ),
                        pageController: PageController(),
                        onPageChanged: (index) {},
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            galleryItem.media?.length ?? 0,
                            (index) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
