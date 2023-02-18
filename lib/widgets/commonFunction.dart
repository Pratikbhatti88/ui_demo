import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:ui_demo/widgets/unicornOutlineButton.dart';

import '../resources/resource.dart';

class CommonFunction{
  confirmationDialog(BuildContext context, String text, Function() onYes) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: SizedBox(
                height: 134,
                width: deviceWidth(context) * 0.778,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(text,
                        textAlign: TextAlign.center,
                        style: textStyle14(const Color(0xff181F27)).copyWith(height: 1.3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UnicornOutlineButton(
                          strokeWidth: 2,
                          radius: 30,
                          height: 34,
                          width: deviceWidth(context) * 0.3,
                          gradient: const LinearGradient(colors: [
                            color4138,
                            color8556,
                            color8B72,
                            color8B95,
                            color57E4,
                          ]),
                          child: GradientText(
                            'No',
                            style: textStyle16Bold(),
                            colors: const [
                              color4138,
                              color8556,
                              color8B72,
                              color8B95,
                              color57E4,
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 10),
                        gradientButton(context,'Yes', 30, 34, deviceWidth(context) * 0.3, onYes),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  gradientButton(BuildContext context,String title, double radius, double height, double width, Function() onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient:  const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color4138,
                color8556,
                color8B72,
                color8B95,
                color57E4,
              ],
            )),
        child: Center(child: Text(title, style: textStyle16Bold(colorWhite))),
      ),
    );
  }
}