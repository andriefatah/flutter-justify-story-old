/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow-narrow-left.svg
  String get arrowNarrowLeft => 'assets/icons/arrow-narrow-left.svg';

  /// File path: assets/icons/filter.svg
  String get filter => 'assets/icons/filter.svg';

  /// File path: assets/icons/gallery.svg
  String get gallery => 'assets/icons/gallery.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/setting.svg
  String get setting => 'assets/icons/setting.svg';

  /// File path: assets/icons/success.svg
  String get success => 'assets/icons/success.svg';

  /// File path: assets/icons/time.svg
  String get time => 'assets/icons/time.svg';

  /// File path: assets/icons/transaction.svg
  String get transaction => 'assets/icons/transaction.svg';

  /// File path: assets/icons/trash.svg
  String get trash => 'assets/icons/trash.svg';

  /// File path: assets/icons/user.svg
  String get user => 'assets/icons/user.svg';

  /// List of all assets
  List<String> get values => [
        arrowNarrowLeft,
        filter,
        gallery,
        home,
        logout,
        setting,
        success,
        time,
        transaction,
        trash,
        user
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/about_me_images.png
  AssetGenImage get aboutMeImages =>
      const AssetGenImage('assets/images/about_me_images.png');

  /// File path: assets/images/alif-ngoylung-jg-6ARMiaPM-unsplash.jpg
  AssetGenImage get alifNgoylungJg6ARMiaPMUnsplash => const AssetGenImage(
      'assets/images/alif-ngoylung-jg-6ARMiaPM-unsplash.jpg');

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/booking_image.png
  AssetGenImage get bookingImage =>
      const AssetGenImage('assets/images/booking_image.png');

  /// File path: assets/images/feedback_image.png
  AssetGenImage get feedbackImage =>
      const AssetGenImage('assets/images/feedback_image.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/no-images.png
  AssetGenImage get noImages =>
      const AssetGenImage('assets/images/no-images.png');

  /// File path: assets/images/payment_image.png
  AssetGenImage get paymentImage =>
      const AssetGenImage('assets/images/payment_image.png');

  /// File path: assets/images/personal_settings.svg
  String get personalSettings => 'assets/images/personal_settings.svg';

  /// File path: assets/images/personal_settings_image.png
  AssetGenImage get personalSettingsImage =>
      const AssetGenImage('assets/images/personal_settings_image.png');

  /// File path: assets/images/profil.png
  AssetGenImage get profil => const AssetGenImage('assets/images/profil.png');

  /// File path: assets/images/splash-screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash-screen.png');

  /// File path: assets/images/success.png
  AssetGenImage get success => const AssetGenImage('assets/images/success.png');

  /// List of all assets
  List<dynamic> get values => [
        aboutMeImages,
        alifNgoylungJg6ARMiaPMUnsplash,
        background,
        bookingImage,
        feedbackImage,
        logo,
        noImages,
        paymentImage,
        personalSettings,
        personalSettingsImage,
        profil,
        splashScreen,
        success
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
