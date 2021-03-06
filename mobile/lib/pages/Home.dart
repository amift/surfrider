import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:surfrider/configs/api_config.dart';
import 'package:surfrider/connexion/Login.dart';

import 'package:surfrider/partials/HistoryCard.dart';
import 'package:surfrider/pages/Session.dart';
import 'package:surfrider/partials/Navbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();


}

class _HomeState extends State<Home> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _profileFetch();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    print("SESSION=>>>>>>>>>>" + sharedPreferences.getString("token"));

    if(sharedPreferences.getString("token") == null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (route) => false);
    }else{
      await fetchProfile();
    }
  }

  Future _profileFetch() async {
    sharedPreferences.getString("token")
   /* var map = Map<String, dynamic>();
    map['token'] = token;

    var response = await http.post(api.profile, headers:map);
    var jsonData = json.decode(response.body);

    if(jsonData['status'] == "error"){
      setState(() {
        sharedPreferences.setString("token", null);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (route) => false);
      });
    }
    else{
      print(response.body);
    }*/
  }

  Widget History() {

    List<Widget> historyElement = new List<Widget>();
    historyElement.add(Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        child:Text("History", style: TextStyle(fontSize: 18, color: Color.fromRGBO(68, 75, 119, 1), fontWeight: FontWeight.w600))
    ));

    var card = HistoryCard();
    historyElement.add(card.getWidget(context));
    historyElement.add(SizedBox(height: 30,));
    historyElement.add(card.getWidget(context));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: historyElement,
    );
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Session(),
                            )
                        );
                      },
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 145,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 235, 235, 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.power_settings_new,
                                size: 52,
                                color: Color.fromRGBO(68, 75, 119, 1),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Start a session",
                                style: TextStyle(fontSize: 18, color: Color.fromRGBO(68, 75, 119, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    History()
                  ],
                ),
              ),
            ),
            Navbar(),
          ]
        ),
      ),
    );
  }
}
