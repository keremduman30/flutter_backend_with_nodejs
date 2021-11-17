import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tekrar/core/init/notifier/thema_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instace;

  static ApplicationProvider get instance {
    _instace = ApplicationProvider._init();
    return _instace!;
  }

  ApplicationProvider._init();
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    
  ];
}
