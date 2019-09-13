

import 'package:flutter/material.dart';

import 'HomePage.dart';

void main()=> runApp(MyApp());






class MyApp extends StatelessWidget {



 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     theme: ThemeData(
      
     ),
     debugShowCheckedModeBanner: false,
      home: MainPage(), 
    );
  }
}


class MainPage extends StatefulWidget {
  @override
   _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
 
 
      GlobalKey<FormState> _key = new GlobalKey();
      String count;
         bool autovalidate=false;
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: _key,
              child: Stack(
         

          children: <Widget>[

            
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                 image: AssetImage("assets/thor.jpg"),
                fit: BoxFit.cover
              ),
            ),
          ),



            Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

               Container(padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                 child: Text(
                   "Random User",style:TextStyle(fontFamily: "Satisfy",fontSize:40.0,color: Colors.white),
                 ),
               ),


                Material(
                elevation: 10.0,
                color: Colors.white30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0))),
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 20.0, top: 10.0, bottom: 10.0),
                  child: TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Count for 'Random Users',",
                        hintStyle: TextStyle(color: Colors.white,fontFamily: "Satisfy" , fontSize: 20)),
                        onSaved:(input)=>count=input ,
                        validator: (input){
                        

                      if(input.isEmpty){
                        return "Enter Number";
                      }
                      
                    },


                  ),
                ),
                
          ),


        Container(padding:EdgeInsets.fromLTRB(20.0, 5.0, 1.0, 5.0),
           child: FloatingActionButton(
             onPressed: sendtonextpage,
             child: Icon(
               Icons.send,
               color:Colors.white,
            
             ),tooltip: "Click2Continue",
             backgroundColor: Colors.black,
           ),
          ),

        // ListTile(

        //  leading: Icon(Icons.phone_android),
        //           title: TextFormField(
        //             keyboardType: TextInputType.number,
        //             validator: (input){
        //               if(input.isEmpty){
        //                 return "Enter Mobile number";
        //               }
                      
        //             },
        //             decoration: InputDecoration(border: OutlineInputBorder(),labelText: "MobileNumber",labelStyle: TextStyle(color: Colors.white)),
        //             onSaved:(input)=>count=input ,

        //           ),
          
        // ),

              ],
            ),
          ],
        ),
      ),
    );
  }
   sendtonextpage(){

if(_key.currentState.validate()){
      _key.currentState.save();
      Navigator.push(context,
       MaterialPageRoute(
        builder: (contex)=>HomePage(
        count: count,
        ))
      );
      
    }
    else {
      setState(() {
        autovalidate = true;
      });

       }
  }
} 






















