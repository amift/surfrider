import 'package:flutter/material.dart';

import 'package:surfrider/pages/Profile.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: new TextSpan(
                    style: new TextStyle(
                        fontSize: 15
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: "Surf", style: new TextStyle(color: Color.fromRGBO(68, 75, 119, 1))),
                      new TextSpan(text: "Rider", style: new TextStyle(color: Color.fromRGBO(75, 122, 252, 1),fontWeight: FontWeight.w600)),
                    ]
                )
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    )
                );
              },
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
