import 'package:flutter/material.dart';
import 'package:ui_demo/resources/images.dart';
import 'package:ui_demo/resources/styles.dart';

import 'resources/dimensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  _onClickButton() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        isScrollControlled: true,
        context: context,
        builder: (context) => Stack(
              children: [
                Container(
                  height: deviceHeight(context) * 0.955,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: deviceHeight(context) * 0.045,bottom: deviceHeight(context) * 0.13),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth(context) * 0.04),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: deviceHeight(context) * 0.08,
                                      width: deviceHeight(context) * 0.08,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: deviceWidth(context) * 0.03),
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(imgUser),
                                              fit: BoxFit.contain)),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Aldavideo Ronaldo',
                                          style: textStyle16Bold(Colors.black),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '@adefeafag',
                                          style: textStyle10(Colors.black26),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: deviceHeight(context) * 0.015),
                                  child: Text(
                                    'There is no denying the fact that the success of an advertisement lies mostly in the headline. The headline should attract the reader and make him read the rest of the reader.',
                                    style: textStyle13(Colors.black)
                                        .copyWith(height: 1.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(height: 2, color: Colors.grey.withOpacity(0.25)),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.08,
                                deviceHeight(context) * 0.02,
                                deviceWidth(context) * 0.04,
                                0),
                            child: Column(
                              children: List.generate(5, (index) => IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: deviceWidth(context) * 0.01,right: deviceWidth(context) * 0.03),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: deviceHeight(context) * 0.065,
                                            width: deviceHeight(context) * 0.065,
                                            decoration: const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(imgUser),
                                                    fit: BoxFit.contain)),
                                          ),
                                          if(index!=4)Expanded(child: Container(width: 2,color: Colors.grey.withOpacity(0.25)))
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4),
                                          child: Text(
                                            'Aldavideo Ronaldo',
                                            style: textStyle13Bold(Colors.black),
                                          ),
                                        ),
                                        Text(
                                          '@adefeafag',
                                          style: textStyle10(Colors.black26),
                                        ),
                                        Container(
                                          width: deviceWidth(context)*0.7,
                                          margin: EdgeInsets.only(top: 10,bottom: 20),
                                          child: Text(
                                            'Het vait niet te antkennen dat gshf reclamesucces grotendeels te danken',
                                            style: textStyle12(Colors.black).copyWith(height: 1.3),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      Container(
                        height: deviceHeight(context) * 0.13,
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.35),
                            offset: const Offset(0.0, -2.0),
                            blurRadius: 6.0,
                          )
                        ]),
                      ),
                      Positioned(
                        child: Container(
                          height: deviceHeight(context) * 0.13,
                          width: deviceWidth(context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                              ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Ready to Publish?', style: textStyle14Medium(Colors.black)),
                              Container(
                                height: deviceHeight(context)*0.055,
                                width: deviceWidth(context)*0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.blueAccent,
                                        Colors.tealAccent,
                                      ],
                                    )
                                ),
                                child: Center(child: Text('Yes', style: textStyle12Bold(Colors.black))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: deviceWidth(context) * 0.02,
                    right: deviceWidth(context) * 0.025,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close,
                            color: Colors.red, size: 25)))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _onClickButton,
        style: ElevatedButton.styleFrom(primary: Colors.white),
        child: const Text(
          'Open Bottom Sheet',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
    );
  }
}
