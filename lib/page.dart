import 'package:flutter/material.dart';

class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  List num=[1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemCount: num.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
            child: Text("${num[index]}"),
          );
      },)
    );
  }
}
