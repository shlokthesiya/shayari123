import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari123/data.dart';
import 'package:shayari123/page3.dart';

class second extends StatefulWidget {
  int  index;
  second(this.index);


  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  List s=[];

  @override
  void initState() {
    super.initState();

    if(widget.index==0)
      {
       s=data.sha1;
      }
    else if(widget.index==1)
    {
      s=data.sha2;
    }

    else if(widget.index==2)
    {
      s=data.sh3;
    }
    else if(widget.index==3)
    {
      s=data.sh4;
    }
    else if(widget.index==4)
    {
      s=data.sh5;
    }
    else if(widget.index==5)
    {
      s=data.sh6;
    }
    else if(widget.index==6)
    {
      s=data.sh7;
    }
    else if(widget.index==7)
    {
      s=data.sh8;
    }
    else if(widget.index==8)
    {
      s=data.sh9;
    }
    else if(widget.index==9)
    {
      s=data.sh10;

    }




    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love shayari"),
      ),
      body: ListView.builder(
        itemCount: s.length,
        itemBuilder: (context, index)  {
         return Card(
           child:InkWell(onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
               return third(s, index);
             },));           },
           child: ListTile(
             title: Text("${s[index]}",maxLines: 1,),

             leading: Container(
               width: 50,
               height: 50,
               child: Image.asset("image/${data.img[widget.index]}"),
             ),
           ),
           ),
         );
      },),
    );
  }
}
