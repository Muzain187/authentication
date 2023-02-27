import 'package:appwrite/appwrite.dart';
import 'package:authentication/chat/chatHome.dart';
import 'package:flutter/material.dart';

late Client client;
late Account account;

class Authentication {
  Authentication() {
    try {
      client = Client();
      account = Account(client);

      client
              .setEndpoint('https://3f9b-103-185-199-67.in.ngrok.io/v1') // Your API Endpoint
              .setProject('63eb23359bf9c5a01a7d') // Your project ID
              .setSelfSigned()

          ;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      final result = await account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      const snackBar = SnackBar(
        content: Text('Account created auccessfully'),
      );
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> signin(String email,String password,BuildContext ctx) async{
    try{
      final result = await account.createEmailSession(
        email: email,
        password: password,
      );
      print("logged");
      Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) => chatHome()) );
    }catch(e){
      print(e);
    }
  }
  Future<void> OAuth(String provider) async{
    try{
      final result = await account.createOAuth2Session(
        provider: provider,

      );
      print(result);
    }catch(e){
      print("Google error:");
      print(e);
    }
  }
}
