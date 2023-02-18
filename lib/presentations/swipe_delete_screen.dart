import 'package:flutter/material.dart';
import 'package:ui_demo/resources/resource.dart';
import 'package:ui_demo/resources/styles.dart';

import 'main_screen.dart';

class SlideToDelete extends StatefulWidget {
  const SlideToDelete({super.key});

  @override
  State<SlideToDelete> createState() => _SlideToDeleteState();
}

class _SlideToDeleteState extends State<SlideToDelete> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.delete,color:colorBlack),
                          Text('Delete',style: textStyle12(Colors.black))
                        ],
                      ),
                    ),
                    key: ValueKey<int>(items[index]),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(
                        'Item ${items[index]}',
                      ),
                    ),
                  );
                },
              ),
            ),
            const Expanded(flex:2,child: MainScreen())
          ],
        ),
      ),
    );
  }
}
