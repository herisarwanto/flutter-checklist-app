import 'package:flutter/material.dart';
import 'package:my_application/common/constants/constant.dart';
import 'package:my_application/common/utils/global_helper.dart';
import 'package:my_application/features/home/home.dart';
import 'package:my_application/features/sign_in/view/sign_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _getAuthData();
    super.initState();
  }

  Future<void> _getAuthData() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final token = sharedPreferences.getString(AppConstant.tokenKey);

    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    } else {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const SignInPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Constant.kPrimaryColor,
        child: Center(
          child: Container(
            width: 200.0,
            height: 80.0,
            decoration: const BoxDecoration(
              // color: Constant.kSecondaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
            child: const Center(
              child: Text(
                'Checklist App',
                style: TextStyle(color: Colors.black, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
