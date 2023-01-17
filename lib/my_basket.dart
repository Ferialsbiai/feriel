// In this page , the user find the list of articles that he adds to his basket
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_page.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyBasket extends StatelessWidget {
  const MyBasket({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_left_sharp, size: 35),
            onPressed: () {
              // return to home page
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
            },
          ),
          title:const  Text("My Basket"),
          titleTextStyle: const TextStyle(
            letterSpacing: 2,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 25.0,
          ),
          backgroundColor: Colors.black,
        ),
       // static examples of products
       body: Container(
         child:  Wrap(spacing: 30,
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
                                         Icons.delete,
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
                           Text('chaise'),
                           Text('20 DT'),
                           Text('adresse : Tunis'),
                           Text('29015147')
                         ],
                       ),
                     ),
                   ],
                 ),
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
                                         Icons.delete,
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
                               "assets/img/kwatrou.jpg",
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
                                         Icons.delete,
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
                           Text('tableau'),
                           Text('50 DT'),
                           Text('adresse : Tunis'),
                           Text('98001203')
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ]),
       ),
      ),
    );
  }
}
