import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class second extends StatefulWidget {

  int cur_level;
  second(this.cur_level);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  SharedPreferences ?prefs;

  List num=[1,2,3,4,5,6,7,8,9,10];
  List img=["p1.png","p2.png","p3.png","p4.png","p5.png","p6.png","p7.png","p8.png","p9.png","p10.png"];
  String ans="";


  @override
  void initState() {

    get();
  }

  get()
  async {

    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WillPopScope(child: Container(
        height: 876,
        width: 560,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("pic/gamebackground.jpg"),fit: BoxFit.fill)
        ),

//--------------------------------------------------------------------------------------------------------------------

        child: Column(children: [
          Expanded(child: Row(children: [
            InkWell(
              onTap: () {

                prefs!.setString('levelno${widget.cur_level}' , "skip");
                widget.cur_level++;
                ans="";
                prefs!.setInt('level', widget.cur_level);
                
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    
                    title: Text("Skip " "\n\nYou can skip this level in 29 Minutes 57 Seconds"),
                    
                    actions: [
                      Row(children: [
                        TextButton(onPressed: () {
                          
                        }, child: Text("OK")),
                        
                        TextButton(onPressed: () {
                          
                        }, child: Text("Cancel"))
                      ],)
                    ],
                  );
                },);
                setState(() {

                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 30,bottom: 10),
                height: 50,
                width: 50,
                child: Image.asset("pic/skip.png"),
              ),
            ),

//--------------------------------------------------------------------------------------------------------------------

            Container(
              margin: EdgeInsets.only(left: 35,right: 35,bottom: 10),
              alignment: Alignment.center,
              height: 60,
              width: 250,

              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("pic/level_board.png",),)),

              child: Text("Puzzle :- ${widget.cur_level+1}",style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            ),

//--------------------------------------------------------------------------------------------------------------------

            InkWell(
              onTap: () {


              },
              child: Container(
                margin: EdgeInsets.only(left: 30,right : 10,bottom: 10),
                height: 50,
                width: 50,
                child: Image.asset("pic/hint.png"),
              ),
            )
          ],)),

//--------------------------------------------------------------------------------------------------------------------

          Container(
            margin: EdgeInsets.only(bottom: 300),
            height: 400,
            width: 450,
            child: Image.asset("${img}"),
          ),

//--------------------------------------------------------------------------------------------------------------------

          Expanded(
            child: Row(children: [
              Expanded(
                child: Container(
                  height: 130,
                  width: 230,
                  color: Colors.black,

//---------------------------------------------------------------------------------------------------------------------

                  child: Column(children: [
                    Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 30,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),

                        child: Text("${ans}",style: TextStyle(fontSize: 25),),
                      ),

//--------------------------------------------------------------------------------------------------------------------
                      InkWell(
                        onTap: () {

                          ans=ans.substring(0,ans.length-1);
                          setState(() {

                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 30,
                          width: 30,
                          child: Image.asset("pic/delete.png"),
                        ),
                      ),

//----------------------------------------------------------------------------------------------------------------
                      InkWell(
                        onTap: () {

                          ans="";
                          setState(() {

                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          color: Colors.grey.shade900,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2,color: Colors.white)
                          // ),
                          child: Text("C",style: TextStyle(color: Colors.white),),
                        ),
                      ),
//--------------------------------------------------------------------------------------------------------------------

                      InkWell(
                        onTap: () {

                          if(num[widget.cur_level] == int.parse(ans))
                          {

                            prefs!.setString('levelno${widget.cur_level}', "win");
                            widget.cur_level++;
                            ans="";
                            prefs!.setInt('level', widget.cur_level);
                            setState(() {

                            });
                          }

                          else
                          {

                            Fluttertoast.showToast(
                                msg: "Wrong ans!.......",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 35),
                          alignment: Alignment.center,
                          height: 30,
                          child: Text("Submit",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
                        ),
                      )
                    ],),

//--------------------------------------------------------------------------------------------------------------------

                    Expanded(child: Row(children: [
                      Expanded(child: SingleChildScrollView(
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              onTap: () {

                                ans=ans+1.toString();
                                setState(() {

                                });
                              },
                              child:  Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("1"),
                              ),
                            ),


//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+2.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("2"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+3.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("3"),
                              ),
                            ),

//-------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+4.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("4"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+5.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("5"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+6.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("6"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+7.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("7"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+8.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("8"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+9.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("9"),
                              ),
                            ),

//--------------------------------------------------------------------------------------------------------------------

                            InkWell(
                              onTap: () {

                                ans=ans+0.toString();
                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 28,
                                width: 30,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Text("0"),
                              ),
                            ),

                          ],),
                      ))
                    ],))
                  ],),
                ),
              )
            ],),
          )
        ],),
      ),
        onWillPop: ()
        async{
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return first();
          },)
        );
        return false;
      },)
    );
  }
}
