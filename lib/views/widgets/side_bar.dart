import 'package:flutter/material.dart';
import 'package:flutter_start_mvvm/locator.dart';
import 'package:flutter_start_mvvm/viewmodels/home_viewmodel.dart';

class SideBar extends StatelessWidget {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584__340.png"),
                  ),
                  Text("Hanan")
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Daftar'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'dashboard');
            },
          ),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              _homeViewModel.logout();
            },
          ),
        ],
      ),
    );
  }
}
