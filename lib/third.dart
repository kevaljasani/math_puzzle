import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class third extends StatefulWidget {

  List list;
  int cur_level;
  third(this.list,this.cur_level);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: [
        Expanded(child: Container(
            height: 500,
            width: double.infinity,

            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("pic/wall.jpg"),fit: BoxFit.fill),
            ),
          
          child: Column(children: [
            Container(
              child: Text("Select Puzzle",style: TextStyle(fontSize: 30,color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            ),

//----------------------------------------------------------------------------------------------------------------

            Expanded(child: GridView.builder(
              itemCount: 24,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 25,
                    child: (index < widget.cur_level) ? Text("${index+1}",style: TextStyle(fontSize: 30),):null,

                    decoration: BoxDecoration(
                      border: (index < widget.cur_level) ? Border.all(width: 3):null,
                      borderRadius: BorderRadius.circular(20),
                      image: (index < widget.cur_level) ? (widget.list[index] == "win") ?
                          DecorationImage(image: AssetImage("pic/tick.png")): null :
                           DecorationImage(image: AssetImage("pic/lock.png"))
                    ),
                  );
                },)),

//----------------------------------------------------------------------------------------------------------------

            Container(
              margin: EdgeInsets.only(bottom: 7,left: 400),
              height: 60,
              width: 60,
              child: Image.asset("pic/next.png"),
            )
            ],),
          ))
      ],),
    );
  }
}
