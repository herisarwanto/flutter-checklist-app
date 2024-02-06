import 'package:dio/dio.dart';
import 'package:my_application/common/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalHelper {
  factory GlobalHelper() {
    return _singleton;
  }

  GlobalHelper._internal();

  static final GlobalHelper _singleton = GlobalHelper._internal();

  late Dio dio;
  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    final options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    dio = Dio();
    dio.options = options;

    sharedPreferences = await SharedPreferences.getInstance();
  }
}
