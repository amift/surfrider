import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:surfrider/connexion/Login.dart';
import 'package:surfrider/configs/api_config.dart';
import 'package:surfrider/pages/Home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  createAccount(String username, String email, String password) async {
    var map = Map<String, dynamic>();
    map['password'] = password;
    map['email'] = email;
    map['username'] = username;
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(api.register, body:map);
    jsonData = json.decode(response.body);
    if(jsonData['status'] == "ok"){
      setState(() {
        sharedPreferences.setString("token", jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (route) => false);
      });
    }
    else{
      print(response.body);
    }
  }


  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(30,0,30,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: "Surf", style: new TextStyle(color: Color.fromRGBO(24, 29, 61, 1))),
                          new TextSpan(text: "Rider", style: new TextStyle(color: Color.fromRGBO(75, 122, 252, 1))),
                        ]
                    )
                ),
                SizedBox(height: 80,),
                Text(
                  "You want to join us ?",
                  style: TextStyle(color: Color.fromRGBO(24, 29, 61, 1), fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(height: 10,),
                Text(
                  "We're just going to need some information...",
                  style: TextStyle(color: Color.fromRGBO(24, 29, 61, 1), fontSize: 15),
                ),
                SizedBox(height: 50,),

                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  controller:passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.https),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: Icon(Icons.replay),
                  ),
                ),
                SizedBox(height: 50,),
                MaterialButton(
                  onPressed: () {
                    createAccount(usernameController.text, emailController.text, passwordController.text);
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  height: 45,
                  color: Color.fromRGBO(75, 122, 252, 1),
                  child: Text("CREATE ACCOUNT",style: TextStyle(fontSize: 17, color: Colors.white),),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        )
                    );
                  },
                  child: Text(
                    "Already have an account ?",
                    style: TextStyle(color: Color.fromRGBO(24, 29, 61, 1), fontSize: 15),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
