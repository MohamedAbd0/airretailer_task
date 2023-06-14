import 'package:airretailer_task/core/constants/extensions/context.dart';
import 'package:airretailer_task/features/authentication/presentaion/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../src/shard/widget/BoxButton.dart';
import '../../../../../src/shard/widget/InputField.dart';
import '../../../../../src/shard/widget/box_text.dart';

class LoginScreen extends StatelessWidget {
  static const name = '/login';
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseHeight = context.height * 0.025;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: baseHeight * 10),
              const BoxText.headingThree('Login'),
              SizedBox(height: baseHeight),
              BoxInputField(
                title: 'Username/Email ID',
                controller: _emailController,
                placeholder: 'Enter username or email ID',
              ),
              BoxInputField(
                title: 'Password',
                controller: _passwordController,
                placeholder: 'Enter password',
                password: true,
              ),
              SizedBox(height: baseHeight * 2),
              ChangeNotifierProvider<AuthController>(
                create: (_) => sl<AuthController>(),
                child: Consumer<AuthController>(
                  builder: (context, model, child) {
                    return BoxButton(
                      busy: model.loading,
                      title: 'Submit',
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        model.login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          context: context,
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoxText.body('Not registered yet?', color: Colors.black),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Create an account'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
