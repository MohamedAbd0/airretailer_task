// ignore_for_file: file_names

import 'package:airretailer_task/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../src/shard/app_colors.dart';
import '../../../../../src/shard/widget/BoxButton.dart';
import '../../../../../src/shard/widget/InputField.dart';
import '../../../../../src/shard/widget/box_text.dart';
import '../../provider/auth.dart';

class RegisterScreen extends StatelessWidget {
  static const name = '/register';

  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseHeight = context.height * 0.025;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon:
                      const Icon(Icons.arrow_back_ios, color: kcLightBlueColor),
                ),
              ),
              const BoxText.headingThree('Registaration Form'),
              SizedBox(height: baseHeight),
              BoxInputField(
                controller: _nameController,
                placeholder: 'Name',
                title: 'Name',
              ),
              BoxInputField(
                controller: _emailController,
                placeholder: 'Email',
                title: 'Email',
              ),
              BoxInputField(
                controller: _genderController,
                placeholder: 'Gender',
                title: 'Gender',
              ),
              BoxInputField(
                controller: _passwordController,
                placeholder: 'Enter Password',
                title: 'Password',
                password: true,
              ),
              SizedBox(height: baseHeight),
              ChangeNotifierProvider<AuthController>(
                create: (_) => sl<AuthController>(),
                child: Consumer<AuthController>(
                  builder: (context, model, child) {
                    return BoxButton(
                      busy: model.loading,
                      title: 'Next',
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        model.register(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          gender: _genderController.text.trim(),
                          password: _passwordController.text.trim(),
                          context: context,
                        );
                      },
                    );
                  },
                ),
              ),
              BoxButton(
                title: 'Back to login form',
                labelColor: kcLightBlueColor,
                backgroundColor: kcLightBlueColor.withOpacity(0.05),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
