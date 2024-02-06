import 'package:my_application/common/utils/global_helper.dart';

class Util {
  static String getToken() {
    final token = GlobalHelper().sharedPreferences.getString('token_key');

    return token ?? '';
  }
}
