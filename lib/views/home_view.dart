import 'package:flutter/material.dart';
import 'package:flutter_start_mvvm/_constants/ui_helpers.dart';
import 'package:flutter_start_mvvm/_helpers/text_helper.dart';
import 'package:flutter_start_mvvm/models/user.dart';
import 'package:flutter_start_mvvm/viewmodels/home_viewmodel.dart';
import 'package:flutter_start_mvvm/views/base_view.dart';
import 'package:flutter_start_mvvm/views/widgets/side_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model)=> model.getPosts(1),
      statusBarTheme: Brightness.dark,
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          drawer: SideBar(),
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: model.busy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UIHelper.verticalSpaceLarge(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Welcome ${Provider.of<User>(context).name}',
                        style: headerStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Here are all your posts',
                          style: subHeaderStyle),
                    ),
                    UIHelper.verticalSpaceSmall(),
                  ],
                )),
    );
  }
}
