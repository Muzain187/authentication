import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/authservices.dart';

class signinwidget extends StatelessWidget {
  const signinwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    // final Authentication auth = Authentication();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "email*", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "password*", border: OutlineInputBorder()),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                signwithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text("Sigin with google")
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              signin(emailcontroller.text,passwordcontroller.text,context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Sign in")],
            ),
          ),
        ],
      )),
    );
  }
  Future<void> signin(String email,String password,BuildContext context) async{
    print("Signing");
    final Authentication auth = Authentication();
    await auth.signin(email, password,context);
  }
  Future<void> signwithGoogle() async {
    print("Google sign in...");
    final Authentication auth = Authentication();
    await auth.OAuth('google');
  }
}
