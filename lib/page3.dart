import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari123/data.dart';
import 'package:shayari123/page%204.dart';

class third extends StatefulWidget {
  int index;
  List s;

  third(this.s, this.index);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  PageController controller = PageController();
  List s = [];
  bool temp=false;
  Color c=Colors.pink;

  int col_ind=0;

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.height; // screen ni full height
    double status_bar = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    double height = screen - status_bar - app_bar;
    return Scaffold(
        appBar: AppBar(
          title: Text("Love shayari"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height,
                          child: GridView.builder(
                            itemCount: data.color.length-1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                         temp=true;
                                           col_ind=index;
                                           Navigator.pop(context);
                                           setState(() {

                                           });
                                    },
                                    child:  Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [data.color[index],data.color[index+1]])
                                      ),
                                    ),
                                  );
                              },),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image(
                      image: AssetImage("image/expand.png"),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: Text("${widget.index + 1}/${widget.s.length}"),
                )),
                Expanded(
                    child: InkWell(
                      onTap: () {
                         int r=Random().nextInt(data.color.length-1); 
                         col_ind=r;
                         setState(() {

                         });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage("image/reload.png"),
                        ),
                      ),
                    ))
              ],
            )),
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      controller: controller,
                      onPageChanged: (value) {
                        print(value);
                        widget.index = value;
                        setState(() {});
                      },
                      itemCount: widget.s.length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${widget.s[widget.index]}",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [data.color[col_ind],data.color[col_ind+1]])
                      ),
                        );
                      },
                    ))
                  ],
                )),
            Spacer(),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              FlutterClipboard.copy("${widget.s[widget.index]}")
                                  .then((value) => print('copied'));
                            },
                            child: Container(
                              child: Icon(Icons.copy),
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              if (widget.index > 0) {
                                widget.index--;
                              }
                              setState(() {});
                            },
                            child: Container(
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          )),
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return four(widget.s,widget.index);
                                    },
                                  ));
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                      image: AssetImage("image/pencil2.png")),
                                )),
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              if (widget.index < widget.s.length - 1) {
                                widget.index++;
                              }
                              setState(() {});
                            },
                            child: Container(
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Share.share("${widget.s[widget.index]}");
                            },
                            child: Container(
                              child: Icon(Icons.share),
                            ),
                          ))
                        ],
                      ))
                    ],
                  ),
                ))
              ],
            ))
          ],
        ));
  }
}
