import 'dart:ui';

import 'package:beauty_flutter/modules/home/home_controller.dart';
import 'package:beauty_flutter/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller = HomeController(onUpdate: () {
    setState(() {});
  });

  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  void dispose() {
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 32.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Welcome back, ${controller.userModel.name}!",
                                        style: TextStyles.titlePage,
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      Text(
                                        "“We are the ones we've been waiting for. We are the change that we seek.” ― Barack Obama",
                                        style: TextStyles.quoteText,
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Sorry"),
                                                  content: Text(
                                                      "Sorry but this app is still in development, for now that's all"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        controller.userModel
                                                            .email = '';
                                                        controller.userModel
                                                            .password = '';
                                                        controller.userModel
                                                            .name = '';
                                                        Navigator
                                                            .pushReplacementNamed(
                                                                context,
                                                                '/login');
                                                      },
                                                      child: Text("Logout"),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Be Beauty',
                                              style: TextStyles.titlePage,
                                            ),
                                            Icon(
                                              Icons.double_arrow_sharp,
                                              size: 48,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
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
