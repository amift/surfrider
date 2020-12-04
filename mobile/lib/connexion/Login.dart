import 'package:flutter/material.dart';

import 'package:surfrider/connexion/Register.dart';

class Login extends StatelessWidget {
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

              TextField(
                decoration: InputDecoration(
                  hintText: 'Email / Username',
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              TextField(
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