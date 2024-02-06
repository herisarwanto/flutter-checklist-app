import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/common/utils/state_enum.dart';
import 'package:my_application/common/widgets/flutter_toast.dart';
import 'package:my_application/features/sign_in/sign_in.dart';
import 'package:my_application/features/sign_up/bloc/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: SignUpWidget(
        formKey: _formKey,
        emailController: _emailController,
        passwordController: _passwordController,
        usernameController: _usernameController,
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController usernameController,
  })
      : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _usernameController = usernameController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) async {
        if (state.status == StatusState.success) {
          toastInfo(msg: state.message);
          if(!context.mounted) return;
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const SignInPage(),
            ),
          );
        } else if (state.status == StatusState.failure) {
          toastInfo(msg: 'SignUp Failed');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign UP'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          context.read<SignUpBloc>().add(
                            DoSignUp(
                              email: _emailController.text,
                              password: _passwordController.text,
                              username: _usernameController.text,
                            ),
                          );
                        }
                      },
                      child: const Text('SignUp'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
