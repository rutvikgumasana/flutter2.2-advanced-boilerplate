import 'package:flutter/material.dart';
import 'package:pvr_customer_app/src/style/colors.dart';
import 'package:pvr_customer_app/src/widgets/buttons/outline_button.dart';
import 'package:pvr_customer_app/src/widgets/buttons/text_button.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  TextEditingController? controller = TextEditingController();

  Widget loginForm() {
    return Container(
      child: Column(
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              color: primaryWhite,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          PrimaryTextButton(
            height: 50,
            width: 100,
            title: "Submit",
            onPressed: () {
              print("CLICK ON ME");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/main_image.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            color: bgBlueColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 50),
                  child: Image.asset(
                    'assets/images/pvr_logo.png',
                    alignment: Alignment.center,
                  ),
                ),
                loginForm()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
