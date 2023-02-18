import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:ui_demo/blocs/tour_data/tour_data_bloc.dart';
import 'package:ui_demo/model/tour_data_model.dart';
import 'package:ui_demo/resources/resource.dart';

import '../presentations/login_screen.dart';
import 'commonFunction.dart';
import 'unicornOutlineButton.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool isAlphaTag = false;
  bool isHashTag = true;
  bool isFlag = false;
  bool isSnackBar = false;
  int index = 0;
  TourPlace tourPlace =
      TourPlace(uid: '', img: '', name: '', tag: '', description: '');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourPlaceBloc, TourPlaceState>(
      builder: (context, state) {
        if (state is CardState) {
          return cardListView(state.cardList);
        }
        return cardListView(tourPlaceList);
      },
    );
  }

  cardListView(List<TourPlace> placeList) {
    return Stack(
      children: [
        Container(
          height: deviceHeight(context) * 0.96,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: colorTweetBG),
          child: placeList.isEmpty
              ? Center(
                  child: Text('No Tweet', style: textStyle16Bold(colorWhite)))
              : Column(
                  children: [
                    Container(
                      height: deviceHeight(context) * 0.96,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: colorTweetBG),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: deviceHeight(context) * 0.045, bottom: 235),
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
                                              horizontal:
                                                  deviceWidth(context) * 0.03),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      placeList.first.img!),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                placeList.first.name!,
                                                style:
                                                    textStyle16Bold(colorWhite),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      placeList.first.tag!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: textStyle11(
                                                          colorText738D),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${placeList.first.description!.length > 280 ? 280 : placeList.first.description!.length}/280',
                                                        style:
                                                            textStyle12Medium(
                                                                colorText738D),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 8,
                                                            right: deviceWidth(
                                                                    context) *
                                                                0.025),
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            constraints:
                                                                const BoxConstraints(),
                                                            onPressed: () {
                                                              setState(() {
                                                                index = 0;
                                                                tourPlace =
                                                                    placeList
                                                                        .first;
                                                                isSnackBar =
                                                                    true;
                                                              });
                                                              BlocProvider.of<
                                                                          TourPlaceBloc>(
                                                                      context)
                                                                  .add(CardRemoveEvent(
                                                                      uid: placeList
                                                                          .first
                                                                          .uid!));
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                if (mounted) {
                                                                  setState(() {
                                                                    isSnackBar =
                                                                        false;
                                                                  });
                                                                }
                                                              });
                                                            },
                                                            icon: const Image(
                                                              image: Svg(
                                                                  icClose,
                                                                  size: Size(
                                                                      20, 20),
                                                                  color:
                                                                      colorText738D),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              deviceHeight(context) * 0.015),
                                      child: Text(
                                        placeList.first.description!.length >
                                                280
                                            ? placeList.first.description!
                                                .substring(0, 280)
                                            : placeList.first.description!,
                                        style: textStyle14(colorWhite)
                                            .copyWith(height: 1.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (placeList.length != 1)
                                Column(
                                  children: [
                                    Container(height: 2, color: colorText738D),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      deviceWidth(context) * 0.08,
                                      deviceHeight(context) * 0.01,
                                      deviceWidth(context) * 0.04,
                                      0),
                                  child: Column(
                                    children: List.generate(
                                        placeList.length,
                                        (i) => i == 0
                                            ? Container()
                                            : IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: deviceWidth(
                                                                  context) *
                                                              0.01,
                                                          right: deviceWidth(
                                                                  context) *
                                                              0.03),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: deviceHeight(
                                                                    context) *
                                                                0.065,
                                                            width: deviceHeight(
                                                                    context) *
                                                                0.065,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        placeList[i]
                                                                            .img!),
                                                                    fit: BoxFit
                                                                        .fill)),
                                                          ),
                                                          if (i !=
                                                              placeList.length -
                                                                  1)
                                                            Expanded(
                                                                child: Container(
                                                                    width: 2,
                                                                    color:
                                                                        colorCECE))
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 4),
                                                          child: Text(
                                                            placeList[i].name!,
                                                            style:
                                                                textStyle13Bold(
                                                                    colorWhite),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: deviceWidth(
                                                                  context) *
                                                              0.7,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  placeList[i]
                                                                      .tag!,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: textStyle11(
                                                                      colorText738D),
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${placeList[i].description!.length > 280 ? 280 : placeList.first.description!.length}/280',
                                                                    style: textStyle12Medium(
                                                                        colorText738D),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 8,
                                                                        right: deviceWidth(context) *
                                                                            0.025),
                                                                    child: IconButton(
                                                                        padding: EdgeInsets.zero,
                                                                        constraints: const BoxConstraints(),
                                                                        onPressed: () {
                                                                          setState(
                                                                              () {
                                                                            index =
                                                                                i;
                                                                            tourPlace =
                                                                                placeList[i];
                                                                            isSnackBar =
                                                                                true;
                                                                          });
                                                                          BlocProvider.of<TourPlaceBloc>(context)
                                                                              .add(CardRemoveEvent(uid: placeList[i].uid!));
                                                                          Future.delayed(
                                                                              const Duration(seconds: 2),
                                                                              () {
                                                                            if (mounted) {
                                                                              setState(() {
                                                                                isSnackBar = false;
                                                                              });
                                                                            }
                                                                          });
                                                                        },
                                                                        icon: const Image(
                                                                          image: Svg(
                                                                              icClose,
                                                                              size: Size(20, 20),
                                                                              color: colorText738D),
                                                                        )),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: deviceWidth(
                                                                  context) *
                                                              0.7,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 7,
                                                                  bottom: 20),
                                                          child: Text(
                                                            placeList[i]
                                                                        .description!
                                                                        .length >
                                                                    280
                                                                ? placeList[i]
                                                                    .description!
                                                                    .substring(
                                                                        0, 280)
                                                                : placeList[i]
                                                                    .description!,
                                                            style: textStyle13(
                                                                    colorWhite)
                                                                .copyWith(
                                                                    height:
                                                                        1.3),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        if (placeList.isNotEmpty)
          Positioned(
              bottom: 0,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.5,
                    sigmaY: 1.5,
                  ),
                  child: Container(
                    height: 235,
                    width: deviceWidth(context),
                    decoration: BoxDecoration(
                      color: colorBlack.withOpacity(0.75),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 4,
                          width: 40,
                          margin: EdgeInsets.only(
                              top: deviceHeight(context) * 0.018),
                          decoration: BoxDecoration(
                              color: colorText738D,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  tagButton('@Vtranslateapp', isAlphaTag, () {
                                    setState(() {
                                      isAlphaTag = !isAlphaTag;
                                    });
                                  }),
                                  tagButton('#Vtranslate', isHashTag, () {
                                    setState(() {
                                      isHashTag = !isHashTag;
                                    });
                                  }),
                                  tagButton('Flag', isFlag, () {
                                    setState(() {
                                      isFlag = !isFlag;
                                    });
                                  }),
                                ],
                              ),
                              CommonFunction().gradientButton(
                                  context,
                                  'Tweet',
                                  20,
                                  54,
                                  deviceWidth(context) * 0.8,
                                  () => CommonFunction().confirmationDialog(
                                      context,
                                      'Are you sure to publish tweets\non Twitter?',
                                      () => null)),
                              UnicornOutlineButton(
                                strokeWidth: 2,
                                radius: 20,
                                height: 54,
                                width: deviceWidth(context) * 0.8,
                                gradient: const LinearGradient(colors: [
                                  color4138,
                                  color8556,
                                  color8B72,
                                  color8B95,
                                  color57E4,
                                ]),
                                child: GradientText(
                                  'Logout',
                                  style: textStyle16Bold(),
                                  colors: const [
                                    color4138,
                                    color8556,
                                    color8B72,
                                    color8B95,
                                    color57E4,
                                  ],
                                ),
                                onPressed: () => CommonFunction()
                                    .confirmationDialog(
                                        context,
                                        'Are you sure to logout\nfrom your Twitter account?',
                                        () => Navigator.of(context)
                                            .pushNamed(LogInScreen.route)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        if (isSnackBar)
          Positioned(
            bottom: placeList.isEmpty ? deviceHeight(context) * 0.01 : 240,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSnackBar = false;
                });
                BlocProvider.of<TourPlaceBloc>(context)
                    .add(CardAddEvent(index: index, tourPlace: tourPlace));
              },
              child: Container(
                height: deviceHeight(context) * 0.055,
                width: deviceWidth(context),
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorCACA, colorECFF],
                )),
                alignment: Alignment.centerLeft,
                child: Text('Undo', style: textStyle16Bold(Colors.black87)),
              ),
            ),
          ),
        Positioned(
            top: deviceWidth(context) * 0.02,
            right: deviceWidth(context) * 0.025,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, color: colorText738D, size: 25)))
      ],
    );
  }

  tagButton(String tag, bool selectTag, Function() onClick) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.015),
      child: selectTag
          ? GestureDetector(
              onTap: onClick,
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color4138,
                        color8556,
                        color8B72,
                        color8B95,
                      ],
                    )),
                child: Row(
                  children: [
                    if (tag == 'Flag')
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(Icons.flag,
                            size: 15,
                            color: selectTag ? colorWhite : color4138),
                      ),
                    Text(tag, style: textStyle14Bold(colorWhite)),
                  ],
                ),
              ),
            )
          : CustomPaint(
              painter: GradientPainter(
                strokeWidth: 2,
                radius: 30,
                gradient: const LinearGradient(colors: [
                  color4138,
                  color8556,
                  color8B72,
                  color8B95,
                  color57E4,
                ]),
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onClick,
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (tag == 'Flag')
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(Icons.flag,
                              size: 15,
                              color: selectTag ? colorWhite : color4138),
                        ),
                      GradientText(
                        tag,
                        style: textStyle14Bold(),
                        colors: const [
                          color4138,
                          color8556,
                          color8B72,
                          color8B95,
                          color57E4,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
