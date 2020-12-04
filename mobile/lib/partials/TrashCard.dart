import 'package:flutter/material.dart';

class TrashCard{
  String name = "Trash";
  String img = "assets/img/sun.png";
  Color color = Color.fromRGBO(2, 87, 242, 1);
  final int id;

  TrashCard(this.id);

  String weather = "assets/img/sun.png";

  int getId(){
    return this.id;
  }

  void changeColor(bool isActive) {
    if(isActive){
      this.color = Color.fromRGBO(2, 87, 242, 0.8);
    }
    else{
      this.color = Color.fromRGBO(2, 87, 242, 1);
    }
  }

  Widget getWidget(context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(img,width: 50,),
          Text(name,style:TextStyle(color:Colors.white)),
        ],
      ),
    );
  }


}