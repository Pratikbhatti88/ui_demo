import 'package:flutter/material.dart';
import 'package:ui_demo/resources/resource.dart';
import 'package:ui_demo/widgets/bottomSheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  _onClickButton() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(20))),
        isScrollControlled: true,
        context: context,
        builder: (context) => const MyBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _onClickButton,
        style: ElevatedButton.styleFrom(primary: colorWhite),
        child: const Text(
          'Open Bottom Sheet',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
    );
  }

}
