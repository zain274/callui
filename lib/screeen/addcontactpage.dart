import 'package:callui/components/contactList.dart';
import 'package:callui/screeen/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class addcontact extends StatefulWidget {
  const addcontact({super.key});

  @override
  State<addcontact> createState() => _addcontactState();
}

class _addcontactState extends State<addcontact> {

TextEditingController name=TextEditingController();
TextEditingController surname=TextEditingController();
TextEditingController number=TextEditingController();


 addNewContact(context) {
    setState(() {
      Navigator.pop(context);
      DataConstants.contacts.add({
        "name": name.text,
        "surname":surname.text,
        "number": number.text,
      });
      name.clear();
    });
    print(DataConstants.contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
       IconButton(onPressed: (){
addNewContact(context);
Navigator.push(
    

  context,
    MaterialPageRoute(builder: (context) => contact()),
   
  );
       }, icon: Icon(Icons.check))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
          
            
             
          
          
               Text("Name"),
           Container(
          height: 100,
          width: 300,
           child: TextField(
                                    controller: name,

            decoration: InputDecoration(
              hintText: 'Enter name',
              border: OutlineInputBorder(
                
              )
            ),
            ),
           ),
          
               
          Text("Surname"),
           Container(
                 height: 100,
          
          width: 300,
           child: TextField(
                                    controller: surname,

            decoration: InputDecoration(
              hintText: 'Enter surname',
              border: OutlineInputBorder(
                
              )
            ),
            ),
           ),
          
             Text("Phone number"),
           Container(
                  height: 100,
          
          width: 300,
           child: TextField(
                                    controller: number,

            decoration: InputDecoration(
              hintText: '+998  _ _   _ _ _   _ _   _ _',
              border: OutlineInputBorder(
                
              )
            ),
            ),
           ),
             
            ],
          ),
        ),
      ),
    
    
   


    );
  }
}