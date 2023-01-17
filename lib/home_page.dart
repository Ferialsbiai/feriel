import 'package:flutter/material.dart';
import 'package:flutterproject/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'about_us.dart';
import 'login_page.dart';
import 'Add_article.dart';
import 'mesarticles.dart';
import 'auth_page.dart';
import 'my_basket.dart';

// cette page contient le store ainsi que toutes les options qui peut un utilisateur les faire
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          // c'est le code de l'app bare ou se trouve le menu
          appBar: AppBar(
            title: const Text("Darna"),
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 28.0,
                fontFamily: 'cursive'),
            backgroundColor: Colors.black,

          ),
         // c'est le code de drawer
          drawer: Drawer(
            child: ListView(
              children: [

                // first listview item : on peut se deplacer à la page ajouter article
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration:const BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () => {
                        // passage à la page suivante
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Add_article()))
                      },
                      splashColor: Colors.lightBlue,
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.add),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Add article",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),
                              ],
                            ),
                           const Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // second listview item : on peut se deplacer à la page my basket ou se trouve les articles que l'utilisateur les a ajoutéés dans son panier
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration:const  BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => MyBasket()))
                      },
                      splashColor: Colors.lightBlue,
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:const  [
                                Icon(Icons.shopping_basket),
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text("My Basket",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),

                              ],
                            ),
                          const  Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // third listview item : on peut se deplacer à la page mes articles ou se trouve les articles que l'utilisateur les a déposées
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration:const  BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => mesarticles()))
                      },
                      splashColor: Colors.lightBlue,
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:const  [
                                Icon(Icons.bar_chart),
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text("My collection",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),

                              ],
                            ),
                            const  Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // fourth list item element : on peut deplacer à la page  about us qui contient des informations sur Darna
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration:const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => About_us()))
                      },
                      splashColor: Colors.lightBlue,
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:const  [
                                Icon(Icons.info),
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text("About_us",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),
                              ],
                            ),
                         const   Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               // last list item element : l'utilisateur peut se déconnecter
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration:const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey))),
                    child: InkWell(
                      onTap: () => {
                      FirebaseAuth.instance.signOut()
                      },
                      splashColor: Colors.lightBlue,
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:const  [
                                Icon(Icons.logout),
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text("Sign out",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),
                              ],
                            ),
                            const   Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          // body
          body: SingleChildScrollView(
            child: Column(
              children: [
                // code du partie supérieure ou se trouve l'image
                Container(
                  // color: Colors.green,
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration:const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/first_img.png'))),
                  child: const Padding(
                    padding:  EdgeInsets.fromLTRB(15, 20, 30, 0),
                    child: Text(
                      "Make your Interior\n Design More\n Personalized",
                      style: TextStyle(
                        fontFamily: 'cursive',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child:const  Center(
                    child: Text(
                      "Store",
                      style: TextStyle(
                        letterSpacing: 10,
                        fontFamily: 'cursive',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // C'est la partie du store ou se trouve les articles : c'est une illustration statique
                Container(
                  child: Wrap(spacing: 30,
                      runSpacing: 10,
                      children: [
                        // produit num1

                        Container(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      height:
                                      MediaQuery.of(context).size.height * 0.25,
                                      width:
                                      MediaQuery.of(context).size.width * 0.4,
                                      child: Image.asset(
                                        "assets/img/korsi.jpg",
                                        fit: BoxFit.cover,
                                      )),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: IconButton(
                                                color: Colors.black,
                                                icon: const Icon(
                                                  Icons.shopping_basket,
                                                  size: 25,
                                                ),
                                                onPressed: () {}),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.4,
                                color: Colors.white,
                                child: Column(
                                  children: const [
                                    Text("korsi",),
                                    Text("30 DT"),
                                    Text("adresse : mednine"),
                                    Text("num :23 719 592")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ]),
                ),
                Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height:
                              MediaQuery.of(context).size.height * 0.25,
                              width:
                              MediaQuery.of(context).size.width * 0.4,
                              child: Image.asset(
                                "assets/img/vaze.jpg",
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: IconButton(
                                        color: Colors.black,
                                        icon: const Icon(
                                          Icons.shopping_basket,
                                          size: 25,
                                        ),
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text('vase'),
                            Text('30 DT'),
                            Text('adresse : Medenine'),
                            Text('phone : 22301159')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}




