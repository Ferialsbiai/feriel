//cette page permet à l'utilisateur de recupéere le mot de passe à travers un lien qui va etre envoyer à son email

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
   try {
     await FirebaseAuth.instance.sendPasswordResetEmail
       (email: _emailController.text.trim());
     showDialog(
       context: context,
       builder: (context){
         return const AlertDialog(
           content: Text('Password reset link ent! check your Email' ),
         );
       },
     );
   } on FirebaseAuthException catch(e){
     print(e);
     showDialog(
       context: context,
         builder: (context){
         return AlertDialog(
           content: Text(e.message.toString()),
         );
     },
     );
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0),
            child: Text ('Enter your Email',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),),
          ),

          const SizedBox(height: 10),
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
        MaterialButton(
          onPressed: passwordReset,
        child:  Text('Reset Password'),
          color: Colors.deepPurple[200],
        ),
      ],
      ),
    );
  }
}
