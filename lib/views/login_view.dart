import 'package:flutter/material.dart';
import 'package:flutter_start_mvvm/_widgets/ColorLoader.dart';
import 'package:flutter_start_mvvm/_widgets/RaisedGradientButton.dart';
import 'package:flutter_start_mvvm/viewmodels/login_viewmodel.dart';
import 'package:flutter_start_mvvm/views/base_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) {
        model.checkLogin();
      },
      statusBarTheme: Brightness.dark,
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            model.screenLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildContainer(model, context),
          ],
        ),
      )),
    );
  }

  Container buildContainer(LoginViewModel model, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Column(
            children: <Widget>[
              Flexible(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(110)),
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFCB5B25),
                              const Color(0xFFE49035)
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment(0.0, 1),
                              child: Image.asset(
                                  "lib/_assets/images/image_02.png"),
                            ),
                            Column(
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment(0.0, 0.5),
                                    child: Image.asset(
                                      "lib/_assets/images/unesco.png",
                                      width: 150,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    alignment: Alignment(0.0, 0.0),
                                    child: Text(
                                      "BINGHAN",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 40,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                  )),
              Flexible(
                flex: 10,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Username"),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                child: Card(
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18.0),
                                    child: TextField(
                                      controller: _email,
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.email,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Email'),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                child: Card(
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18.0),
                                    child: TextField(
                                      controller: _password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.lock,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Password'),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  alignment: Alignment(1, 0.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text("Forgot Passwords ?"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: RaisedGradientButton(
                                    child: (model.busy)
                                        ? Container(
                                            width: 30,
                                            height: 30,
                                            child: ColorLoader2(),
                                          )
                                        : Text(
                                            'LOGIN',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFFE18A32),
                                        Color(0xFFE06529)
                                      ],
                                    ),
                                    onPressed: () {
                                      model.login(_email.text, _password.text);
                                    }),
                              ),
                              Center(
                                child: Text("Don't have an account ? Register"),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
