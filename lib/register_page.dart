//cette page permet à l'utilisateur de s'inscrire  à notre application
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key,required  this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }
  Future signUp() async{
   if (passwordConfirmed()) {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: _emailController.text.trim(),
       password: _passwordController.text.trim(),
     );
   }
  }

//pour la confirmation du mot de passe choisi par l'utilisateur
  bool passwordConfirmed()
  {
    if (_passwordController.text.trim() == _confirmpasswordController.text.trim())
      {
        return true;
      }
    else
      {
        return false;
      }

  }
  @override
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
              const Text('Hello There!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),

              const SizedBox(height: 10),

              const  Text('Register Below with your details',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const  SizedBox(height: 50),




              //dans la partie qui suit se trouve les textfields pour la saisie d'un email et du mot de passe du l'utilisateur
              //et la confirmation du mot de passe pour éviter tout conflit et errrurs lors du saisie du password et le bouton sign up ainsi qu'un boutons pour le switch vers login page
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
              //confirmpassword textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: TextField(
                  obscureText: true,
                  controller: _confirmpasswordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'confirm Password',

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
                    onTap: signUp ,
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
              //not a member? register nom

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('I am a member!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap:widget.showLoginPage,
                    child:const Text(' Login Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),



            ],),
        ),
      ),
    );
  }
}
