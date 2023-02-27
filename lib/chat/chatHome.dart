import 'package:authentication/chat/chatroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class chatHome extends StatelessWidget {
  const chatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Hii"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout),),
        ],
      ),
      body: Column(
        children: [
          searchwidget(),
          Expanded(child: listChats()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            height: 1000,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(ctx);
                    },
                    iconSize: 50,
                    color: Colors.blue,
                    icon: Icon(Icons.cancel),
                  ),
                  Row(

                    children: [
                      Expanded(child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                          ),
                          hintText: "Enter email address",

                        ),
                      ),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.send_rounded),color: Colors.blue,),
                    ],
                  ),
                ],
              ),
            )
          );
        },
      );
    },
    child: Icon(Icons.add),
    ),
    );
  }
}

class searchwidget extends StatelessWidget {
  const searchwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
          // color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),


              ),
            ),
            IconButton(
              icon: Icon(Icons.search,color: Colors.blue,),
              onPressed: () {
                // TODO: Search action
              },
            ),
          ],
        ),
      ),

    );
  }
}

class listChats extends StatelessWidget {
  const listChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext ctx,int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("name $index"),
                    leading: CircleAvatar(
                      child: Text('JM'),
                    ),
                    focusColor: Colors.grey,
                    onTap: (){
                        print("tap");
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                          return ChatRoom(name: "name $index",);
                        },),);
                    },
                  ),
                );
            },
        ),
    );

  }
}


