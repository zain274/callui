import 'package:callui/screeen/Group.dart';
import 'package:callui/screeen/Recents.dart';
import 'package:callui/screeen/contact.dart';
import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {

 int _currentIndex = 0;
  final List<Widget> abc = [
    const Recents(),
    const contact(),
    const Group()
  ];



  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


   bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Recents", backgroundColor: Color(0xffE7EDFB),),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: "Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
        ],
      ),

            body: abc[_currentIndex],

    );
  }
}