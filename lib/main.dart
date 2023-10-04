import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari123/data.dart';
import 'package:shayari123/page.dart';
import 'package:shayari123/page2.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, home: first(),));
}
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  List l=[];

  @override
  void initState() {
    l=List.filled(data.name.length,false );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love shayari"),
      ),
      body: ListView.builder(
        itemCount: data.name.length,
        itemBuilder: (context, index) {
            return Card(
              child: InkWell(onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return second(index);
                 },));
              },
                  child: GestureDetector(
                    onTapUp: (detais) {
                      l[index]=false;


                      setState(() {

                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return second(index);
                      },));
                       // print("how are you");
                    },
                    onTapDown:(detais) {
                      l[index]=true;

                      setState(() {

                      });
                      //print("good");

                    },
                    onTapCancel: () {
                      l[index]=false;
                      setState(() {
                        //print("i am fine");
                      });
                    },



                child: ListTile(
                  trailing: (l[index]==true)? Icon(Icons.arrow_back_ios):null,
              tileColor: (l[index]==true)? Colors.pink:null,
              title: Text("${data.name[index]}"),
              leading: Container(
                width: 50,
                height: 50,
               child: Image.asset("image/${data.img[index]}"),
          ),
            )
              )
              )
          );
      },),
    );
  }
}
