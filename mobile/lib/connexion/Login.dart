import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:surfrider/pages/Home.dart';
import 'package:surfrider/connexion/Register.dart';
import 'package:surfrider/configs/api_config.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  signIn(String username, String password) async {
    var map = Map<String, dynamic>();
    map['password'] = password;
    map['username'] = username;
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(api.login, body:map);
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
                  "Sign In",
                  style: TextStyle(color: Color.fromRGBO(24, 29, 61, 1), fontWeight: FontWeight.w600, fontSize: 20),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        )
                    );
                  },
                  child: Text(
                    "You don't have an account ?",
                    style: TextStyle(color: Color.fromRGBO(24, 29, 61, 1), fontSize: 15),
                  ),
                ),
                SizedBox(height: 50,),

                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    suffixIcon: Icon(Icons.people),
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.https),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password ?")
                  ],
                ),
                SizedBox(height: 50,),
                MaterialButton(
                  onPressed: () {
                    signIn(usernameController.text, passwordController.text);
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  height: 45,
                  color: Color.fromRGBO(75, 122, 252, 1),
                  child: Text("SIGN IN",style: TextStyle(fontSize: 17, color: Colors.white),),
                )
              ],
            ),
          )
      ),
    );
  }
}
