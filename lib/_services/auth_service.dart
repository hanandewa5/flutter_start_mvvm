import 'dart:async';
import 'package:flutter_start_mvvm/_services/api.dart';
import 'package:flutter_start_mvvm/locator.dart';
import 'package:flutter_start_mvvm/models/user.dart';

class AuthService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();
  Stream<User> get user => userController.stream;

  Future<bool> login(String email, String password) async {
    var fetchedUser = await _api
        .getUserProfile(email, password)
        .timeout(Duration(seconds: 10),onTimeout: (){
          return null;
        });
    print("user = $fetchedUser");

    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}
