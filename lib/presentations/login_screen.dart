import 'package:flutter/material.dart';

import '../resources/resource.dart';
import '../widgets/commonFunction.dart';

class LogInScreen extends StatefulWidget {
  static const route = '/LogIn';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: colorBlack,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tweet', style: textStyle15Medium(colorWhite).copyWith(height: 1.5)),
              Text('To use Tweet feature,\nplease login your Twitter account.', textAlign: TextAlign.center, style: textStyle15Medium(colorWhite).copyWith(height: 1.3)),
              Padding(padding: const EdgeInsets.only(bottom: 20),child: CommonFunction().gradientButton(
                  context,
                  'Login',
                  16,
                  54,
                  deviceWidth(context) * 0.8,
                      () => null)),
            ],
          ),
        ),
      ),
    );
  }
}
