import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  //http://192.168.1.111:3000
  //http://10.192.1.192:3000
  //10.192.1.192
  //kyk yurt 10.52.169.54
  //10.192.1.192 //kutuphanevoid setContext(BuildContext context) => this.context = context;
  void init() {}
  final baseUrl = "http://192.168.1.51:3000";
  late Dio dio;
  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
}

