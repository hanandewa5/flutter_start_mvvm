import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_start_mvvm/viewmodels/basemodel.dart';
import 'package:provider/provider.dart';
import '../locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final Brightness statusBarTheme;

  BaseView({this.builder, this.onModelReady, this.statusBarTheme});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        builder: (context) => model,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: widget.statusBarTheme,
              statusBarIconBrightness: widget.statusBarTheme),
          child: Consumer<T>(builder: widget.builder),
        ));
  }
}
