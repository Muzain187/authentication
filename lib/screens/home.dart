import 'package:authentication/screens/signin.dart';
import 'package:authentication/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 247, 253, 253),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    controller: _tabcontroller,
                    tabs: const [
                      Tab(
                        text: "signup",
                      ),
                      Tab(
                        text: "signin",
                      ),
                    ],
                  ),
                  Expanded(
                    child:
                        TabBarView(controller: _tabcontroller, children: const [
                      signupwidget(),
                      signinwidget(),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
