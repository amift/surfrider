import 'package:flutter/material.dart';

class HistoryCard{
  String spot = "Reims - Canal";
  String date = "12 February 2020";
  int point = 700;


  String weather = "assets/img/sun.png";

  Widget getWidget(context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromRGBO(75, 122, 252, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child:Container(
              width: 35,
                height: 35,
              child:Image.asset(weather)
            )
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width-140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        spot,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text("$point SR",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text(date,style: TextStyle(fontSize: 12,color: Color.fromRGBO(134, 134, 134, 1)),),
            ],
          ),
        ],
      ),
    );
  }


}