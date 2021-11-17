class ImagePathSvg {
  static ImagePathSvg? _instace;
  static ImagePathSvg get instance {
    _instace ??= ImagePathSvg._init();
    return _instace!;
  }

  ImagePathSvg._init();
  final relaxSvg = "relax".toSvg;
  final chatSvg = "chat".toSvg;
  final ast = "ast".toSvg;
}

extension _SvgExtension on String {
  String get toSvg => "assets/svg/$this.svg";
}
