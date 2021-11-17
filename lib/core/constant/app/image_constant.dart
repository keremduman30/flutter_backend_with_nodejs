class ImageConstant {
static ImageConstant? _instace;
static ImageConstant get instance {
 _instace ??= ImageConstant._init();
return _instace!;
}
ImageConstant._init();
  final spash="splash".toPng;
}
extension _ImagePathExtension on String{
  String get toPng=>"assets/images/$this.png";
}