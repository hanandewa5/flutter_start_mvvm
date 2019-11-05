import 'package:flutter/material.dart';
import 'package:flutter_start_mvvm/_services/auth_service.dart';
import 'package:flutter_start_mvvm/locator.dart';
import 'package:flutter_start_mvvm/models/user.dart';
import 'package:flutter_start_mvvm/router.dart' as router;
import 'package:flutter_start_mvvm/_services/navigation_service.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.controller(
      initialData: User.initial(),
      builder: (context) => locator<AuthService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(backgroundColor: Colors.grey[800]),
        onGenerateRoute: router.generateRoute,
        initialRoute: 'Login',
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
