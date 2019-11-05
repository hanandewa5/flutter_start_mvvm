import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start_mvvm/_constants/route_paths.dart' as routes;
import 'package:flutter_start_mvvm/views/home_view.dart';
import 'package:flutter_start_mvvm/views/login_view.dart';
import '_widgets/Dialog.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(
          builder: (context) => DialogManager(
                child: LoginView(),
              ));
    case routes.HomeRoute:
      return MaterialPageRoute(
          builder: (context) => DialogManager(
                child: HomeView(),
              ));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
