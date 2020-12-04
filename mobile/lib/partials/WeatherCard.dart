import 'package:flutter/material.dart';

class WeatherCard{
  final String img;
  Color bg;
  final double size;

  WeatherCard(this.img, this.bg, this.size);

  void changeColor(bool activate) {
    if(activate) {
      bg = Color.fromRGBO(2, 87, 242, 1);
    }
    else{
      bg = Color.fromRGBO(75, 122, 252, 1);
    }
  }

  Widget getWidget(context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(15),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Image.asset(img),
          ),
        ],
      ),
    );
  }


}