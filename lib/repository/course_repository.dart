import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_application/common/constants/constant.dart';
import 'package:my_application/common/utils/global_helper.dart';
import 'package:my_application/common/utils/util.dart';
import 'package:my_application/models/course_model.dart';

class CourseRepository {
  Future<List<CourseModel>?> getAllCourse() async {
    try {
      final requestOption = Options();
      final token = Util.getToken();
      if (token.isNotEmpty) {
        requestOption.headers = {
          'Authorization': 'Bearer $token',
        };
      }

      final response = await GlobalHelper().dio.get<Map<String, dynamic>>(
            AppConstant.courseUrl,
            options: requestOption,
          );

      if (response.statusCode == 200) {
        final list = response.data!['data'] as List? ?? [];
        final data = List<CourseModel>.from(list.map(
          (e) => CourseModel.fromJson(
            e as Map<String, dynamic>? ?? {},
          ),
        ),);

        return data;
      }

      return [];
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
