import 'dart:ui';

import 'package:beauty_flutter/modules/login/login_controller.dart';
import 'package:beauty_flutter/shared/theme/text_styles.dart';
import 'package:beauty_flutter/shared/validators/input_text_validator.dart';
import 'package:beauty_flutter/shared/widget/custom_input_text/custom_input_text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller = LoginController(onUpdate: () {
    setState(() {});
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var email;
  var password;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Beauty",
                        style: TextStyles.titleHome,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                // height:
                                // MediaQuery.of(context).size.height * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 32.0),
                                    child: Column(
                                      children: [
                                        CustomInputTextWidget(
                                          obscureText: false,
                                          onChanged: (value) => {email = value},
                                          validator: (value) =>
                                              InputTextValidator()
                                                  .validateEmail(value!),
                                          labelText: "Insert Email",
                                          controller: _emailController,
                                          focusNode: _emailFocusNode,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomInputTextWidget(
                                          obscureText: true,
                                          onChanged: (value) =>
                                              {password = value},
                                          validator: (value) =>
                                              InputTextValidator()
                                                  .validatePassword(value!),
                                          labelText: "Insert Password",
                                          controller: _passwordController,
                                          focusNode: _passwordFocusNode,
                                        ),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    if (controller.userModel
                                                                .email ==
                                                            email &&
                                                        controller.userModel
                                                                .password ==
                                                            password) {
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context, '/home');
                                                    } else if (controller
                                                                .userModel
                                                                .email ==
                                                            email &&
                                                        controller.userModel
                                                                .password !=
                                                            password) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Wrong Password'),
                                                              content: Text(
                                                                  'Your password is incorrect, do you want to reset your password?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pushReplacementNamed(
                                                                        context,
                                                                        '/recovery');
                                                                  },
                                                                  child: Text(
                                                                      'Reset'),
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    } else if (controller
                                                            .userModel.email !=
                                                        email) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Email does not exist'),
                                                            content: Text(
                                                                'You do not have a valid email address, would you like to create an account?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pushReplacementNamed(
                                                                      context,
                                                                      '/create');
                                                                },
                                                                child: Text(
                                                                    'Create'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: 250,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Center(
                                                      child: Text(
                                                    "Enter",
                                                    style:
                                                        TextStyles.buttonText,
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
