import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //si le client a des données  et il est connecté
          // alors la page qui va etre apparaitre c'est la page home si non la page auth.dart
          // va décider lequels des pages register ou login va apparaitre à l'utilisateur
      if( snapshot.hasData){
      return const HomePage();}
      else{ return  const AuthPage();

      }
      },
      ),
    );
  }
  }

