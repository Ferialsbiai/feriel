//cette page permet à l'utilisateur de se connecter à notre application

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone_android,
              size: 100,),

          const   SizedBox(height: 25),
            //Hello Again!
           const Text('Hello Again!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            ),

       const SizedBox(height: 10),

           const  Text('Welcome back, you\'ve been missed!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
           const  SizedBox(height: 50),

//dans la partie qui suit se trouve le code de saisie de l'email et du mot de passe de l'utlilisateur ainsi qu'un bouton pour se connecter
            //et un autre bouton pour le switch vers page register
            //email textfield
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:25.0),
             child: TextField(
               controller: _emailController,
               decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
                   borderSide: const BorderSide(color: Colors.deepPurple),
                   borderRadius: BorderRadius.circular(12),
                 ),

               focusedBorder: OutlineInputBorder(
                 borderSide: const BorderSide(color: Colors.deepPurple),
                 borderRadius: BorderRadius.circular(12)
               ),
                 hintText: 'Email',
                 fillColor: Colors.grey[200],
                 filled: true,
                   ) ,
                 ),
               ),



           const SizedBox(height: 10),
            //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Password',

                    fillColor: Colors.grey[200],
                    filled: true,
                  ) ,
                ),
              ),







              
              const SizedBox(height: 10),
            //sign in button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  
                  ),
                  child:const  Center(
                    child: Text('Sign In',
                    style:  TextStyle(color: Colors.white,
                      fontSize: 18,

                    ),
                    ),
                  ),
                ),
              ),
            ),

           const SizedBox(height: 25),
            //not a member? register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('Not a member?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap:widget.showRegisterPage,
                  child:const Text(' Register Now',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                      {
                        return ForgotPasswordPage();

                      },
                        ),
                        );
                      },
                      child:const Text('Forgot Password!' ,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),



          ],),
        ),
      ),
    );
  }
}
