import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';


class Routes{
  //screens
  static const dashboard = 'dashboard';

  //routes
  static final routes = <String, Widget Function(BuildContext)>{

    dashboard : (context) =>  const Dashboard(),

  };
}
