import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../responsive.dart';
import '../../../../shared/background.dart';
import '../../../../shared/constant.dart';
import '../../../../shared/custom_flat_button.dart';
import '../../../../shared/custom_text.dart';
import '../../../../shared/validator.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);
  SigninController controller = Get.put(SigninController());

  final _formKey = GlobalKey<FormState>();
  final _textEmail = TextEditingController();
  final _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEmail.text = "admin@ppsuperwheels.com";
    _textPassword.text = "P@ssw0rd";
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 120,
              child: Image.network(
                'assets/images/pp_white.png',
              ),
            ),
            const SizedBox(width: defaultPadding),
            const CustomText(
              text: 'Warranty Management',
              size: 18,
            ),
          ],
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: Container(),
            desktop: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 6,
                            child: SvgPicture.network(
                                "assets/icons/undraw_access_account_re_8spm.svg"),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                cursorColor: primaryColor,
                                controller: _textEmail,
                                decoration: const InputDecoration(
                                  hintText: 'Your Email',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                validator: (value) =>
                                    validateNotEmpty(value!, 'Your Email'),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding),
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  obscureText: true,
                                  cursorColor: primaryColor,
                                  controller: _textPassword,
                                  decoration: const InputDecoration(
                                    hintText: 'Your Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  validator: (value) =>
                                      validateNotEmpty(value!, 'Your Password'),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: defaultPadding),
                                child: CustomFlatButton(
                                  label: 'Sign In'.toUpperCase(),
                                  onPressed: () async {},
                                ),
                              ),
                              const SizedBox(height: defaultPadding),
                            ],
                          ),
                        ),
                      ),
                    ],
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
