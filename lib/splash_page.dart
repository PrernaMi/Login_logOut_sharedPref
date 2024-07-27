import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shard_pref_task1_login_out/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _splashPage();
  }
}

class _splashPage extends State<SplashPage>{
  SharedPreferences? prefs;
  String? mName;
  String? mUid;
  @override
  void initState() {
    nextPage();
    super.initState();
  }
  Widget moveNext = LoginPage();

  void nextPage() async{
    prefs = await SharedPreferences.getInstance();
    mName = prefs!.getString('name');
    mUid = prefs!.getString('uid');
    if(mUid != null && mUid != "" && mName != null && mName != ""){
      moveNext = HomePage();
    }
    Timer(Duration(milliseconds: 400),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return moveNext;
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: FlutterLogo(size: 50,)),
          ],
        ),
      ),
    );
  }

}