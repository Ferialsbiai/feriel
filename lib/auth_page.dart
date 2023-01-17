import 'package:flutter/material.dart';
import 'package:flutterproject/login_page.dart';
import 'package:flutterproject/register_page.dart';



class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens(){
setState(() {
  showLoginPage = !showLoginPage;
});
  }
  @override
  Widget build(BuildContext context) {

    // si l'utilisateur est inscrit dans notre application alors la page login va apparaitre si non  c'est la page registre
    // qui va apparaitre à l'utilisateur à fin de faire l'inscription
    if(showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    }
    else{return RegisterPage( showLoginPage:toggleScreens);
    }
  }
}