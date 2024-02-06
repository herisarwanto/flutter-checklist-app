import 'package:my_application/common/constants/constant.dart';
import 'package:my_application/common/utils/global_helper.dart';

class SignInRepository {
  Future<String?> signIn(String email, String password) async {
    try {
      final data = {
        'email': email,
        'password': password,
      };

      final response = await GlobalHelper().dio.post<Map<String, dynamic>>(
            AppConstant.signInUrl,
            data: data,
          );

      if (response.statusCode == 200) {
        await GlobalHelper()
            .sharedPreferences
            .setString('token_key', response.data!['token'].toString());

        return response.data!['token'].toString();
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
