import 'package:flutter/material.dart';

import 'package:surfrider/configs/routes.dart';
import 'package:surfrider/index/Index.dart';
import 'package:surfrider/connexion/Login.dart';

final router = {
  routes.home: (BuildContext context) => new Index(),
  routes.index: (BuildContext context) => new Index(),
  routes.login: (BuildContext context) => new Login(),
};