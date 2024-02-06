import 'package:my_application/common/constants/constant.dart';
import 'package:my_application/common/utils/global_helper.dart';

class SignInRepository {
  Future<String?> signIn(String email, String password) async {
    try {
      final data = {
        'username': email,
        'password': password,
      };

      final response = await GlobalHelper().dio.post<Map<String, dynamic>>(
            AppConstant.signInUrl,
            data: data,
          );

      if (response.statusCode == 200) {
        final token = response.data!['data']['token'].toString();
        await GlobalHelper()
            .sharedPreferences
            .setString(AppConstant.tokenKey, token);

        return token;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
