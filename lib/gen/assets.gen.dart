/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage arrowTopRight =
      AssetGenImage('assets/arrow_top_right.png');
  static const AssetGenImage camera = AssetGenImage('assets/camera.webp');
  static const AssetGenImage carts = AssetGenImage('assets/carts.png');
  static const AssetGenImage earphone = AssetGenImage('assets/earphone.png');
  static const AssetGenImage feeds = AssetGenImage('assets/feeds.png');
  static const AssetGenImage home = AssetGenImage('assets/home.png');
  static const AssetGenImage likes = AssetGenImage('assets/likes.png');
  static const AssetGenImage profile = AssetGenImage('assets/profile.png');
  static const AssetGenImage radio = AssetGenImage('assets/radio.png');
  static const AssetGenImage settings = AssetGenImage('assets/settings.png');
  static const AssetGenImage speaker = AssetGenImage('assets/speaker.png');
  static const AssetGenImage trophy = AssetGenImage('assets/trophy.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowTopRight,
        camera,
        carts,
        earphone,
        feeds,
        home,
        likes,
        profile,
        radio,
        settings,
        speaker,
        trophy
      ];
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
