import 'dart:async';

import 'package:callui/components/Colorcomponents.dart';
import 'package:callui/screeen/contact.dart';
import 'package:callui/screeen/home.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homeview()),
      );
    });
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorcomponents.Appbarcolor,
        title: Text("Contacts",style: TextStyle(
          color: Colorcomponents.Texticoncolor
        ),),
        actions: [
Padding(
  padding: const EdgeInsets.all(16.0),
  child:   Icon(Icons.search,color:Colorcomponents.Texticoncolor ,),
),



Padding(
  padding: const EdgeInsets.all(16.0),
  child:   Icon(Icons.more_vert_outlined,color: Colorcomponents.Texticoncolor,),
),

        ],


        
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/box.png"),
          SizedBox(height: 25,),
          Text("You have no Contacts yet")
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.push(
    

  context,
    MaterialPageRoute(builder: (context) => contact()),
   
  );
      }, child: Icon(Icons.add),),
    );
  }
}