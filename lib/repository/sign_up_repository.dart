import 'package:my_application/common/constants/constant.dart';
import 'package:my_application/common/utils/global_helper.dart';

class SignUpRepository {
  Future<String?> signUp(String email, String password, String username) async {
    try {
      final data = {
        'email': email,
        'password': password,
        'username': username,
      };

      final response = await GlobalHelper().dio.post<Map<String, dynamic>>(
            AppConstant.signUpUrl,
            data: data,
          );

      if (response.statusCode == 200) {
        final message = response.data!['message'].toString();
        return message;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
