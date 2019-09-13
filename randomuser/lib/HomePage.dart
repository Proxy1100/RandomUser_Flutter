import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';


class HomePage extends StatefulWidget {
 
 final  String count;
HomePage(
  {
    Key key, @required this.count,
  }
):super(key: key);

  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

   var count;
   
  List usersData;
  List data;
  bool isLoading=true;
//  int intcount=int.tryParse(count);
   String url;
 


 
  
   Future getData()async{
   var respone=await http.get(Uri.encodeFull(url), headers: {"Accept": "applications/json"});
   
      data=(json.decode(respone.body)['results'] );
      setState(() {
   
       usersData=data;
       isLoading=false; 
      });
     
   }

   @override
  void initState() {
    super.initState();
   url="https://randomuser.me/api/?results=${widget.count.toString()}";
    this.getData();
  }
   
   
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black,
       
      title: Text("Random Users",style:TextStyle(fontFamily: 'Pacifico',fontSize: 30.0,fontWeight: FontWeight.bold)),
     ),

     body: Container(
      // s
    //       leading: Icon(Icons.person),
    //       title: Text("$intcount"),

       child: Center(
         child: isLoading
         ? CircularProgressIndicator()
         :ListView.builder(
           itemCount: usersData==null ? 0 :usersData.length,
           itemBuilder: (BuildContext context,int index){
             return Card(
               elevation: 10.0,

                child: Row(
                  
                  children: <Widget>[
                     Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                usersData[index]['picture']['thumbnail'])
                        ),
                    )),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            usersData[index]['name']['first'] + " "+usersData[index]
                 ['name']['last'], style: TextStyle(fontFamily: 'Satisfy',fontSize: 25.5),  ),

                             Text("Mail:${usersData[index]['email']  }" ),



                        ],
                      ),
                    ),
                  ],
                ),
             );
           },
         ),
       ),
     ),
    );
  }
} 























// import 'package:flutter/material.dart';


// class HomePage extends StatelessWidget {


//   final String count;
//   HomePage(
//     {
//     Key key, @override this.count,
// })
    
//     : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(backgroundColor: Colors.black,
//   title: Text("User_Info"),),

//   body: SingleChildScrollView(
//     child: Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(50),
        
//         ),
       
//          ListTile(
//           leading: Icon(Icons.mail),
//           title: Text(count),

//         ),
         
//       ],
//     ),
//   ),

//     );
//   }
// }



