import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shayari123/data.dart';

class four extends StatefulWidget {
  List s;
  int index;

  four(this.s, this.index);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
   double size=20;
    Color c=Colors.pink;
List <String> font=["f1","f2","f3","f4"];
  String cur_font="f2";
    bool temp=false;

    String emoji1="🙃 😉 😌 ";

    Color t= Colors.pink;
   int col_ind=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Love shayari"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: (temp==true)?c:Colors.yellow,
                          gradient:(temp==true)? LinearGradient(colors: [data.color[col_ind],data.color[col_ind+1]]):null
                      ),

                      child: Text(

                        "${emoji1}${widget.s[widget.index]}${emoji1}",
                        style: TextStyle(fontSize: size, color:t,fontFamily: cur_font),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black87,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(child: InkWell
                              (onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context, builder: (context) {
                                    return Container(
                                       child: GridView.builder(
                                        itemCount: data.color.length-1,
                                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                             crossAxisCount:2,
                                             crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                                ), itemBuilder: (context, index) {
                                              return InkWell(onTap: () {
                                                  temp=true;
                                                       col_ind=index;
                                                       Navigator.pop(context);
                                                       setState(() {

                                  });
                               },
                                  child: Container(
                                            height: 100,
                                              width: 100,
                                                 decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [data.color[index],data.color[index+1]])
                                                  ),
                                                ),
                                             );
                                        },),
                                     );
                                 },);
                               },

                              child: Container(
                              height: 50,
                              width: 150,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Image(
                              image: AssetImage("image/expand.png"),
                              ),
                               ),
                            ),



                                ),
                                    Expanded(
                                           child: InkWell(
                                                      onTap: () {
                                                          int r=Random().nextInt(data.color.length-1);
                                                                       col_ind=r;
                                                             setState(() {

                                                            });
                                                      },
                                              child: Container(
                              height: 50,
                              width: 150,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage("image/reload.png"),
                              ),
                            ),
                    ) ),
      ],

                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      child: GridView.builder(
                                        itemCount: data.color.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10),
                                          itemBuilder: (context, index) {
                                              return  InkWell(
                                                onTap: () {
                                                     temp=false;
                                                    c=data.color[index];
                                                    Navigator.pop(context);
                                                    setState(() {

                                                    });
                                                },
                                                child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    color:data.color[index]
                                                ),
                                              );
                                          },),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Background",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            InkWell(onTap: () {
                                showModalBottomSheet(context: context, builder:(context) {
                                  return Container(
                                    height: 150,
                                    child: GridView.builder(
                                      itemCount:data.color.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                          (crossAxisCount: 5,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10),
                                      itemBuilder: (context, index) {
                                      return InkWell(onTap: () {

                                        t=data.color[index];
                                        Navigator.pop(context);
                                        setState(() {

                                        });
                                      },
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            color:data.color[index]
                                        ),
                                      );
                                    },),
                                  );

                                },);
                            },
                              child: Container(
                                  width: 120,
                                  height: 50,
                                  color: Colors.red,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Text color",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ),
                            Container(
                                width: 120,
                                height: 50,
                                color: Colors.red,
                                alignment: Alignment.center,
                                child: Text(
                                  "Share",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          InkWell(
                            onTap: () {
                                showModalBottomSheet(context: context, builder: (context) {
                                   return Container(
                                     height: 300,
                                    child: ListView.builder(
                                      itemCount: font.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                         return InkWell(
                                           onTap: () {
                                              cur_font=font[index];
                                              setState(() {

                                              });
                                           },
                                           child: Container(
                                             alignment: Alignment.center,
                                             margin: EdgeInsets.all(5),
                                             height: 50,
                                             width: 90,
                                             color: Colors.yellow,
                                             child: Text("${font[index]}"),),
                                         );
                                    },),
                                   );
                                },);
                            },
                            child:   Container(
                                width: 120,
                                height: 50,
                                color: Colors.red,
                                alignment: Alignment.center,
                                child: Text(
                                  "Font",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                            InkWell(onTap: () {
                              showModalBottomSheet(context: context, builder: (context) {
                                return Container(
                                        child: ListView.builder(
                                          itemCount: data.emoji.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                   emoji1=data.emoji[index];
                                                   setState(() {

                                                   });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 90,
                                                color: Colors.red,
                                                child: Text("${data.emoji[index]}"),
                                              ),
                                            );
                                        },),
                                );

                              },);

                            },
                              child: Container(
                                  width: 120,
                                  height: 50,
                                  color: Colors.red,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Emoji",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ),
                            InkWell(onTap: () {
                                showModalBottomSheet(context: context, builder: (context) {
                                    return Container(
                                      height: 200,
                                      child:StatefulBuilder(builder: (context, setState1) {
                                         return  Slider(
                                           max: 40,
                                           min: 20,
                                           value: size, onChanged: (value) {
                                           size=value;
                                           setState(() {

                                           });
                                           setState1(() {

                                           });
                                         },);
                                      },)
                                    );
                                },);
                            },
                            child:  Container(
                                width: 120,
                                height: 50,
                                color: Colors.red,
                                alignment: Alignment.center,
                                child: Text(
                                  "Taxt size",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),)
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
