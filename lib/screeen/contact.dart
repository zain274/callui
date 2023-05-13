import 'package:callui/components/Colorcomponents.dart';
import 'package:callui/components/contactList.dart';
import 'package:callui/screeen/addcontactpage.dart';
import 'package:flutter/material.dart';


class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
   TextEditingController name=TextEditingController();
TextEditingController surname=TextEditingController();
TextEditingController number=TextEditingController();



   deletUser(i) {
    setState(() {
      DataConstants.contacts.removeAt(i);
    });
  }

  editContact(context, index) {
    setState(() {
      Navigator.pop(context);
      DataConstants.contacts[index] = {
        "name": name.text,
        "surname": surname.text,
        "number": number.text,
      };
      name.clear();
    });
    print(DataConstants.contacts);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

         appBar: AppBar(
        backgroundColor: Colorcomponents.Appbarcolor,
        title: Text("Contacts",style: TextStyle(
          color: Colorcomponents.Texticoncolor,
          fontSize: 15
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

body: Padding(
  padding: const EdgeInsets.all(5.0),
  child:   ListView.builder(
  
    itemCount: DataConstants.contacts.length,
  
    itemBuilder: (context, i) {
  
    return   ListTile(
  
               leading: CircleAvatar(
  
                backgroundColor: Colorcomponents.iconcolor,
                child: Icon(Icons.account_circle,color: Colors.white,)
  
               ),
  
  
  
               title: Text("${DataConstants.contacts[i]['name']}"),
               subtitle:Text("${DataConstants.contacts[i]['number']}") ,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
  IconButton(
                    onPressed: () {
                      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Delete everything?'),
          content: const Text('Are you sure you want to remove everything'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Yes'),
              child: const Text('Yes'),
            ),
          ],
        ),
                      );
      
                      deletUser(i);

                    },
                    icon: const Icon(Icons.delete),
                  ),


                 IconButton(
                  
                    onPressed: () {
                      name.text = DataConstants.contacts[i]['name'];


                      showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Edit Contacts"),
                            content: Container(
                              height: 130,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: name,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Name',
                                      ),
                                    ),
                                SizedBox(height: 10,),
                                     TextField(
                                      controller: surname,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Surname',
                                      ),
                                     ),
                                
                                     SizedBox(height: 10,),
                                
                                    TextField(
                                      controller: number,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Number ',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  editContact(context, i);
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ), 
                ],
              ),
  
  
  
  
  
              
  
  
  
  
  
              
  
  
  
    );
  
  },
  
  
  
  ),
),

floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
    Navigator.push(
    

  context,
    MaterialPageRoute(builder: (context) => addcontact()),
   
  );
  }
)
    );
  }
}