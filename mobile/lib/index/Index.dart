import 'package:flutter/material.dart';

import 'package:surfrider/pages/Home.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Home(),
      ),
    );
  }
}
