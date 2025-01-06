import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/view/forget_password/widget/input_email_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/colors/app_color.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,
                size: 20, color: AppColor.textColorPrimary),
          ),
          title: const Text(
            'Forget Password',
            textScaleFactor: 1.0,
            style: TextStyle(
              color: AppColor.textColorPrimary,
              fontFamily: 'Humanist sans',
              fontWeight: FontWeight.normal,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Get.height * 0.05, top: 45),
                child: Center(
                  child: SvgPicture.asset(
                    IconAssets.ic_change_password,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formkey,
                  child: InputEmailWidget(),
                  // child: TextFormField(
                  //   autocorrect: false,
                  //   autofocus: false,
                  //   enableSuggestions: true,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value!.isEmpty ||
                  //         !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  //             .hasMatch(value)) {
                  //       return 'Enter a valid email address';
                  //     }
                  //     if (_errorMessage != null) {
                  //       return _errorMessage;
                  //     }
                  //     return null;
                  //   },
                  //   keyboardType: TextInputType.emailAddress,
                  //   autofillHints: const [AutofillHints.email],
                  //   controller: _emailController,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: const BorderSide(color: Colors.black),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: const BorderSide(color: appcolor.textColor),
                  //     ),
                  //     hintText: "Email",
                  //     labelText: "Email",
                  //     contentPadding: const EdgeInsets.symmetric(
                  //         horizontal: 20, vertical: 20),
                  //   ),
                  // ),
                ),
              ),
              const SizedBox(height: 38),
              Center(

                // child: ElevatedButton(
                //   style: ButtonStyle(
                //     backgroundColor:
                //         MaterialStateProperty.all(AppColor.textColorPrimary),
                //     padding: MaterialStateProperty.all(
                //         const EdgeInsets.symmetric(
                //             horizontal: 60, vertical: 15)),
                //     shape: MaterialStateProperty.all(
                //       RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8)),
                //     ),
                //   ),
                //   onPressed: () async {
                //     setState(() {
                //       _errorMessage = null;
                //     });
                //
                //     if (!formKey.currentState!.validate()) {
                //       return;
                //     }
                //
                //     // context.loaderOverlay.show();
                //     String email = _emailController.text;
                //     print(email);
                //     bool isSuccess =
                //         await forgetpassword.forgetpass(email, context);
                //
                //     if (!isSuccess) {
                //       setState(() {
                //         _errorMessage = "Email Account Not Found";
                //         formKey.currentState!.validate();
                //       });
                //     }
                //   },
                //   child: const Text(
                //     'Send OTP',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
