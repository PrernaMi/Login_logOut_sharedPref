import 'package:flutter/material.dart';
import 'package:shard_pref_task1_login_out/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  SharedPreferences? prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            SizedBox(
              height: 70,
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: 70,
              width: 300,
              child: TextField(
                controller: uidController,
                decoration: InputDecoration(
                    labelText: "User ID",
                    hintText: "Enter Your User ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    )
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed:() async{
                  prefs = await SharedPreferences.getInstance();
                  prefs!.setString("name", nameController.text.toString());
                  prefs!.setString("uid", uidController.text.toString());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return HomePage();
                  }));
                },
                child: Text("Enter")
            )
          ],
        ),
      ),
    );
  }
}
