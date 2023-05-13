import 'package:callui/components/recents.dart';
import 'package:flutter/material.dart';

class Recents extends StatefulWidget {
  const Recents({super.key});

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "All",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Missed",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                )),
          ],
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: Recent.CallList.length,
          itemBuilder: (context, i) {
          return ListTile(
             leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  foregroundColor: Colors.grey.shade700,
                  child: Text("${Recent.CallList[i]['Leading']}"),
             ),
      
             title: Text("${Recent.CallList[i]['name']}"),
             subtitle: Text("${Recent.CallList[i]['time']}"),
            
          );
      
      
        },),
      ),
    );
  }
}