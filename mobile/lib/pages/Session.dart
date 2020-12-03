import 'package:flutter/material.dart';

import 'package:surfrider/partials/Navbar.dart';
import 'package:surfrider/pages/Home.dart';

class Session extends StatefulWidget {
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {

  List<bool> checkSee = List<bool>();
  List<bool> checkWSee = List<bool>();
  List<bool> checkUse = List<bool>();

  @override
  void initState(){
    for(var i = 0; i<3; i++){
      checkSee.add(false);
    }
    for(var i = 0; i<8; i++){
      checkUse.add(false);
    }
    for(var i = 0; i<3; i++){
      checkUse.add(false);
    }
  }

  Widget whoSee() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Who did you see ?",
            style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),
          ),
          Row(
            children: [
              Checkbox(value: checkSee[0],
                  activeColor: Color.fromRGBO(75, 122, 252, 1),
                  onChanged:(bool newValue){
                    setState(() {
                      checkSee[0] = newValue;
                    });
                    Text('Remember me');
                  }),
              Text("Bathers"),
            ],
          ),
          Row(
            children: [
              Checkbox(value: checkSee[1],
                  activeColor: Color.fromRGBO(75, 122, 252, 1),
                  onChanged:(bool newValue){
                    setState(() {
                      checkSee[1] = newValue;
                    });
                    Text('Remember me');
                  }),
              Text("Practitioners of nautical activities"),
            ],
          ),
          Row(
            children: [
              Checkbox(value: checkSee[2],
                  activeColor: Color.fromRGBO(75, 122, 252, 1),
                  onChanged:(bool newValue){
                    setState(() {
                      checkSee[2] = newValue;
                    });
                    Text('Remember me');
                  }),
              Text("Boat"),
            ],
          ),
        ],
      ),
    );
  }

  Widget whatSee() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("What did you see during your session ?",
            style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),),
          SizedBox(height: 15,),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      checkWSee[0] = true;
                    });
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(2, 87, 242, 10),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/img/sun.png",width: 50,),
                        Text("Trash",style:TextStyle(color:Colors.white)),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      checkWSee[0] = true;
                    });
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(2, 87, 242, 10),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/img/sun.png",width: 50,),
                        Text("Trash",style:TextStyle(color:Colors.white)),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      checkWSee[0] = true;
                    });
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(2, 87, 242, 10),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/img/sun.png",width: 50,),
                        Text("Trash",style:TextStyle(color:Colors.white)),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      checkWSee[0] = true;
                    });
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(2, 87, 242, 10),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/img/sun.png",width: 50,),
                        Text("Trash",style:TextStyle(color:Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget whatUse() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("What did you use ?",
            style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(value: checkUse[0],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[0] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Solar cream"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkUse[1],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[1] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Perfume"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkUse[2],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[2] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Cigarette"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkUse[3],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[3] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Gasoline"),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(value: checkUse[4],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[4] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Makeup"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkUse[5],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[5] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Painting"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkUse[6],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[6] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Moisturizing cream"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkUse[7],
                          activeColor: Color.fromRGBO(75, 122, 252, 1),
                          onChanged:(bool newValue){
                            setState(() {
                              checkUse[7] = newValue;
                            });
                            Text('Remember me');
                          }),
                      Text("Other"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget stopSession(){
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Home(),
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
              "Stop session",
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(68, 75, 119, 1)),
            ),
          ],
        ),
      ),
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
                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    whoSee(),
                    SizedBox(height: 20,),
                    whatSee(),
                    SizedBox(height: 20,),
                    whatUse(),
                    SizedBox(height: 50,),
                    stopSession(),
                    SizedBox(height: 50,),
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
