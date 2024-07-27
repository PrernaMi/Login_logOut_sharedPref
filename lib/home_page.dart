import 'package:flutter/material.dart';
import 'package:shard_pref_task1_login_out/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  String? uid;

  SharedPreferences? prefs;

  @override
  void initState() {
    getVlaueOfPrefs();
    super.initState();
  }

  void getVlaueOfPrefs()async{
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString("name")??"Name not found";
    uid = prefs!.getString("uid")??"uid not found";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $name"),
            SizedBox(height: 20,),
            Text("UID: $uid"),
            SizedBox(height: 20,),
            /*-----------LogOut------------*/
            ElevatedButton(
                onPressed: ()async{
                  prefs = await SharedPreferences.getInstance();
                  prefs!.setString('name', "");
                  prefs!.setString('uid', "");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return LoginPage();
                  }));
                },
                child: Text("logout")
            )
          ],
        ),
      ),
    );
  }
}