import 'package:flutter_start_mvvm/_services/auth_service.dart';
import 'package:flutter_start_mvvm/_services/dialog_service.dart';
import 'package:flutter_start_mvvm/locator.dart';
import 'package:flutter_start_mvvm/_services/navigation_service.dart';
import 'package:flutter_start_mvvm/viewmodels/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();

  String errorMessage;

  Future<bool> login(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setBusy(true);

    if (email == "" && password == "") {
      errorMessage = 'Email Kosong';
      setBusy(false);
      await _dialogService.showDialog();
      return false;
    }

    var success = await _authService.login(email, password);
    if (!success) {
      setErrorMessage('Error has occured with the login');
      await _dialogService.showDialog();
    } else {
      setErrorMessage(null);
      bool isLogin = true;
      await prefs.setBool('isLogin', isLogin);
      _navigationService.replaceTo("Home");
    }

    setBusy(false);
    return success;
  }

  Future checkLogin() async {
    setScreenLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = await prefs.get('isLogin');
    print("testing = $isLogin");
    if (isLogin != null && isLogin != false) {
      Future.delayed(Duration(seconds: 3), () {
        _navigationService.replaceTo("Home");
        return false;
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        setScreenLoad(false);
        return false;
      });
    }
  }
}
