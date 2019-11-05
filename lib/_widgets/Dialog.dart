import 'package:flutter/material.dart';
import 'package:flutter_start_mvvm/locator.dart';
import 'package:flutter_start_mvvm/_services/dialog_service.dart';
import 'package:flutter_start_mvvm/_services/navigation_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(String title, String desc) {
    Alert(
        context: context,
        title: title,
        desc: desc,
        closeFunction: () => _dialogService.dialogComplete(),
        buttons: [
          DialogButton(
            child: Text('Oke'),
            onPressed: () {
              _dialogService.dialogComplete();
              _navigationService.goBack();
            },
          )
        ]).show();
  }
}
