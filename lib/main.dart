
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Screen(),
     );
   }
 }

 class Screen extends StatefulWidget {
   const Screen({Key? key}) : super(key: key);

   @override
   State<Screen> createState() => _ScreenState();
 }

 class _ScreenState extends State<Screen> {

  Future getData()async{
   var fireStore = FirebaseFirestore.instance;
    QuerySnapshot qn = await fireStore.collection("countries").get();
    return qn.docs;
  }


   // Future<String> data2() async {
   //   var data1 = (
   //       await FirebaseFirestore.instance
   //           .collection('listofprods')
   //       .document('ac1')
   //       .get())
   //       .data['name']
   //       .toString();
   //   return data1;
   // }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.teal,
       appBar: AppBar(),
       body: FutureBuilder(
         future: getData(),
         builder: (BuildContext context, snapshot){
           return ListView.builder(
             itemCount: 10,
               itemBuilder: (BuildContext context, index){
                // DocumentSnapshot data = snapshot.data["name"].toString();
                 return ListTile(
                     // title: Text(snapshot.data),
                 );
               }
           );
         },
       ),
     );
   }
 }

