import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool _screenLoading = false;
  bool _busy = false;
  String _errorMessage;

  bool get screenLoading => _screenLoading;
  bool get busy => _busy;
  String get errorMessage => _errorMessage;
  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

  void setScreenLoad(bool value) {
    _screenLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
