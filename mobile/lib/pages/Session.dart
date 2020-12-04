import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:surfrider/partials/Navbar.dart';
import 'package:surfrider/pages/Home.dart';
import 'package:surfrider/partials/TrashCard.dart';
import 'package:surfrider/partials/WeatherCard.dart';


class Session extends StatefulWidget {
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {

  List<bool> checkSee = List<bool>();

  List<bool> checkWSee = List<bool>();
  List<TrashCard> trashCard = List<TrashCard>();

  int checkWeather = 0;
  List<WeatherCard> weatherCard = List<WeatherCard>();

  List<bool> checkUse = List<bool>();

  @override
  void initState(){
    for(var i = 0; i<3; i++){
      checkSee.add(false);
    }

    for(var i = 0; i<8; i++){
      var trash = TrashCard(i);
      checkWSee.add(false);
      trashCard.add(trash);
    }

    for(var i = 0; i<8; i++){
      checkUse.add(false);
    }

    weatherCard.add(WeatherCard("assets/img/sun.png",Color.fromRGBO(75, 122, 252, 1),100.0));
    weatherCard.add(WeatherCard("assets/img/cloud.png",Color.fromRGBO(75, 122, 252, 1),100.0));
    weatherCard.add(WeatherCard("assets/img/cloudy-day.png",Color.fromRGBO(75, 122, 252, 1),100.0));
    weatherCard.add(WeatherCard("assets/img/bolt.png",Color.fromRGBO(75, 122, 252, 1),100.0));
    weatherCard.add(WeatherCard("assets/img/rain.png",Color.fromRGBO(75, 122, 252, 1),100.0));
  }

  Widget whoSee() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Who did you see ?",
            style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),
          ),
          SizedBox(height:20,),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkSee[0] = !checkSee[0];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: checkSee[0] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: checkSee[0]
                        ? Icon(
                      Icons.check,
                      size: 15.0,
                      color: Colors.white,
                    )
                        : Icon(
                      Icons.check_box_outline_blank,
                      size: 15.0,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width:10,),
              Text("Bathers"),
            ],
          ),
          SizedBox(height:20,),

          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkSee[1] = !checkSee[1];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: checkSee[1] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: checkSee[1]
                        ? Icon(
                      Icons.check,
                      size: 15.0,
                      color: Colors.white,
                    )
                        : Icon(
                      Icons.check_box_outline_blank,
                      size: 15.0,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width:10,),
              Text("Practitioners of nautical activities"),
            ],
          ),
          SizedBox(height:20,),

          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkSee[2] = !checkSee[2];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: checkSee[2] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: checkSee[2]
                        ? Icon(
                      Icons.check,
                      size: 15.0,
                      color: Colors.white,
                    )
                        : Icon(
                      Icons.check_box_outline_blank,
                      size: 15.0,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width:10,),
              Text("Boat"),
            ],
          ),
        ],
      ),
    );
  }

  Widget whatSee() {
    List<Widget> cardList = List<Widget>();
    cardList.add(SizedBox(width: 32,));

    for(var trash in trashCard){
      cardList.add(MaterialButton(
          onPressed: () {
            setState(() {
              checkWSee[trash.getId()] = !checkWSee[trash.getId()];
              trash.changeColor(checkWSee[trash.getId()]);
            });
          },
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: trash.getWidget(context),
      ));
    }
    cardList.add(SizedBox(width: 32,));
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
            child: Text("What did you see during your session ?",
              style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),),
          ),
          SizedBox(height: 20,),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cardList
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What did you use ?",
            style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[0] = !checkUse[0];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[0] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[0]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Solar cream"),
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[1] = !checkUse[1];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[1] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[1]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Perfume"),
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[2] = !checkUse[2];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[2] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[2]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Cigarette"),
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[3] = !checkUse[3];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[3] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[3]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Gasoline"),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[4] = !checkUse[4];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[4] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[4]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Makeup"),
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[5] = !checkUse[5];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[5] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[5]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Painting"),
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[6] = !checkUse[6];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[6] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[6]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      Text("Moisturizing cream"),
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            checkUse[7] = !checkUse[7];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: checkUse[7] ? Colors.blue : Color.fromRGBO(196, 196, 196, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: checkUse[7]
                                ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
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

  Widget whatWeather(){
    List<Widget> cardList = List<Widget>();
    cardList.add(SizedBox(width: 32,));
    print(checkWeather);
    for(var i =0; i<weatherCard.length;i++){
      cardList.add(Padding(
        padding: EdgeInsets.fromLTRB(0,0,10,0),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              checkWeather = i;
              for(var j =0; j<weatherCard.length;j++){
                if(j==checkWeather){
                  weatherCard[j].changeColor(true);
                }
                else{
                  weatherCard[j].changeColor(false);
                }
              }
            });
          },
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child: weatherCard[i].getWidget(context)
        ),
      ));
    }
    cardList.add(SizedBox(width: 32,));


    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
            child: Text("How was the weather ?",
              style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),),
          ),
          Container(
            height: 150,
            child: ListView(
                scrollDirection: Axis.horizontal,
              children: cardList,
            ),
          )
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
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: whoSee(),
                  ),
                  SizedBox(height: 30,),
                  whatSee(),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: whatUse(),
                  ),
                  SizedBox(height: 30),
                  whatWeather(),
                  SizedBox(height: 50,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: stopSession(),
                  ),

                  SizedBox(height: 50,),
                ],
              ),
            ),
            Navbar(),
          ]
        ),
      ),
    );
  }
}
