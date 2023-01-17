// c'est la page qui permet l'ajout des articles
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'about_us.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
String imgurl='';
class Add_article extends StatefulWidget {
  const Add_article({Key? key}) : super(key: key);

  @override
  State<Add_article> createState() => _MyAppState();
}

class _MyAppState extends State<Add_article> {
  // list des controlleurs necessaires pour l'ajout d'un articles dans la base de données
  final _namecontroller = TextEditingController();
  final _pricecontroller = TextEditingController();
  final _phoneNumbercontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();


  @override
  void dispose() {
    _namecontroller.dispose();
    _pricecontroller.dispose();
    _phoneNumbercontroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }
// fonction qui permet de l'ajout de l'article dans la base de données
  Future addproductsdetails(String name, int price,int phone,String description,String url) async {
    await FirebaseFirestore.instance.collection('products').add({
      'name': name,
      'price': price,
      'phonenumber': phone,
      'description': description,
      'imageUrl' : url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          appBar: AppBar(
            leading: IconButton(
              // icon qui permet le retour vers la page principale de votre compte
              icon: Icon(Icons.arrow_left_sharp, size: 35),
              onPressed: () {

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
            ),
          ),
          body: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                        child: Image.asset(
                          "assets/img/hala.png",
                        )),
                  ),
    // first text field : entrer le nom de l'article
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: TextField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'Enter the name of the article ',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ) ,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // second text field : entrer le prix de l'article
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: TextField(
                      controller: _pricecontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'Enter the price of the article ',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ) ,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // first text field : entrer le numéro de déposeur
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: TextField(
                      controller: _phoneNumbercontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'Enter your phone number ',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ) ,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // first text field : décrire l'article
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: TextField(
                      controller: _descriptioncontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'Describe your article ',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ) ,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const  Padding(
                        padding:EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Upload the article  ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      IconButton(
                        // thinks to this you can upload the photo of the article from your phona
                        icon:const  Icon(Icons.upload, color: Colors.white, size: 35),
                        onPressed: () async {
                         ImagePicker imagepicker=ImagePicker();
                         XFile? file= await imagepicker.pickImage(source: ImageSource.gallery);
                         Reference referenceRoot=FirebaseStorage.instance.ref();
                         Reference refDirImg=referenceRoot.child('images');
                         String name=DateTime.now().millisecondsSinceEpoch.toString();
                         Reference refImgUp=refDirImg.child(name);
                         await refImgUp.putFile(File(file!.path));
                         imgurl = await refImgUp.getDownloadURL();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200,
                    // bouton qui permet d'ajouter l'article
                    child: ElevatedButton(
                        child: Text('Add',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                          // appel à la fonction qui permet d'ajouter l'article dans la base de données
                           addproductsdetails(_namecontroller.text.trim(),
                               int.parse(_pricecontroller.text.trim()),int.parse(_phoneNumbercontroller.text.trim()),_descriptioncontroller.text.trim(),imgurl);

                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)))),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
