import 'package:flutter/material.dart';

import 'package:surfrider/partials/HistoryCard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Widget body() {

    List<Widget> historyElement = new List<Widget>();
    historyElement.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        child:Text("History", style: TextStyle(fontSize: 18, color: Color.fromRGBO(68, 75, 119, 1), fontWeight: FontWeight.w600))
    ));

    var card = HistoryCard();
    historyElement.add(card.getWidget(context));
    historyElement.add(SizedBox(height: 30,));
    historyElement.add(card.getWidget(context));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: historyElement,
      ),
    );
  }

  Widget header() {
    return Container(
      color: Color.fromRGBO(238, 238, 238, 1),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Container(
            width: 100,
            height: 100,
            child: Image.asset("assets/img/sun.png"),
          ),
          SizedBox(height: 20,),
          Text("John Doe",style:TextStyle(fontSize: 20, color: Color.fromRGBO(24, 29, 61, 1), decoration: TextDecoration.none)),
          Text("Love Biking & eat a lot...",style:TextStyle(fontSize: 13, color: Color.fromRGBO(24, 29, 61, 1), decoration: TextDecoration.none)),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("12 Session",style:TextStyle(fontSize: 13,fontWeight: FontWeight.w600, color: Color.fromRGBO(24, 29, 61, 1), decoration: TextDecoration.none)),
              Text("1500 SR",style:TextStyle(fontSize: 13,fontWeight: FontWeight.w600, color: Color.fromRGBO(24, 29, 61, 1), decoration: TextDecoration.none))
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              header(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Column(
                    children: [
                      body()
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
