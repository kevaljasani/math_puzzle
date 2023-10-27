import 'package:first/second.dart';
import 'package:first/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(home: first(),
    debugShowCheckedModeBanner: false,));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  SharedPreferences ?prefs;
  int cur_level=0;
  List list=[];

  @override
  void initState() {

    get();
    list=List.filled(24, "");
  }

  get()
  async {

     prefs = await SharedPreferences.getInstance();

     cur_level = prefs!.getInt('level')??0;

     for(int i=0;i<cur_level;i++)
       {
         String str=prefs!.getString('levelno$i')??"panding";
         list[i]=str;
       }
     setState(() {

     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar: AppBar(),

      body: Column(children: [
          Expanded(child: Container(
             height: 500,
             width: double.infinity,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage("pic/wall.jpg"),fit: BoxFit.fill),
             ),

//--------------------------------------------------------------------------------------------------------------------

            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                height: 50,
                width: 200,
                child: Text("Math Puzzles", style: TextStyle(fontSize: 30, color: Colors.blue.shade800,
                    fontWeight: FontWeight.bold),),
              ),

//--------------------------------------------------------------------------------------------------------------------

               Expanded(flex: 8 ,child: Row(children: [
                  Container(
                   margin: EdgeInsets.only(left: 15,right: 15),
                  // margin: EdgeInsets.only(top: 50),
                   height: 650,
                   width: 465,
                   decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage("pic/blackboard.png"),fit: BoxFit.fill),
                   ),

//--------------------------------------------------------------------------------------------------------------------

                   child: Column(children: [
                     InkWell(
                       onTap: () {

                         Navigator.push(context,MaterialPageRoute(builder: (context) {
                           return second(cur_level);
                         },));
                       },
                       child: Container(
                         margin: EdgeInsets.only(top: 130,bottom: 20),
                         child: Text("Continue",style: TextStyle(fontSize: 30,color: Colors.white),),
                       ),
                     ),

//--------------------------------------------------------------------------------------------------------------------

                     InkWell(
                       onTap: () {

                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return third(list,cur_level);
                         },));
                       },
                       child: Container(
                         margin: EdgeInsets.only(top: 20,bottom: 20),
                         child: Text("Puzzles",style: TextStyle(fontSize: 30,color: Colors.white),),
                       ),
                     ),

//--------------------------------------------------------------------------------------------------------------------

                     Container(
                       margin: EdgeInsets.only(top: 20,bottom: 20),
                       child: Text("Buy Pro",style: TextStyle(fontSize: 30,color: Colors.white),),
                     )
                   ],),
                 )
                 //)
               ],)),

//--------------------------------------------------------------------------------------------------------------------

              Expanded(child: Row(children: [
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                  height: 70,
                  width: 70,
                  child: Image.asset("pic/ltlicon.png"),
                )),

//--------------------------------------------------------------------------------------------------------------------

                Expanded(child: Row(children: [
                  Expanded(child: Container(
                    height: 30,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(5),
                    ),

                    child: Image.asset("pic/share.png"),
                  ),),

//--------------------------------------------------------------------------------------------------------------------

                  Expanded(child: Container(
                    margin: EdgeInsets.only(left: 5,right: 10,top: 0),
                    height: 30,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset("pic/email.png"),
                  )),
                ],)),

              ],)),
            ],),
          )
          ),
      ],),
    );
  }
}
