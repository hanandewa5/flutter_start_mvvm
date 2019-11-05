import 'package:flutter_start_mvvm/locator.dart';
import 'package:flutter_start_mvvm/_services/dialog_service.dart';
import 'package:flutter_start_mvvm/_services/navigation_service.dart';
import 'package:flutter_start_mvvm/models/post.dart';
import 'package:flutter_start_mvvm/viewmodels/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  List<Post> posts;

  Future<bool> logout({bool success = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setBusy(true);
    bool isLogin = false;
    prefs.setBool('isLogin', isLogin);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured during sign out');
    } else {
      setErrorMessage(null);
      _navigationService.replaceTo("Login");
    }

    setBusy(false);
    return success;
  }

  Future doThings() async {
    print("print dialog show");
    await _dialogService.showDialog();
    print("dialog closed");
  }

  Future getPosts(int userId) async {
    // setBusy(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin');
    print('test : $isLogin');

    // posts = await _api.getPostsForUser(userId);
    // setBusy(false);
  }
}
