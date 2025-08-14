import 'package:flutter/material.dart';
import 'package:practida_daniel/pages/Code_example/Page_Example_GridView_count.dart';
import 'package:practida_daniel/pages/Page_AppBar.dart';
import 'package:practida_daniel/pages/Page_Card.dart';
import 'package:practida_daniel/pages/Page_Column.dart';
import 'package:practida_daniel/pages/Page_Drawer.dart';
import 'package:practida_daniel/pages/Page_GestureDetector.dart';
import 'package:practida_daniel/pages/Page_Image.dart';
import 'package:practida_daniel/pages/Page_ListTile.dart';
import 'package:practida_daniel/pages/Page_MaterialApp.dart';
import 'package:practida_daniel/pages/Page_Navigator.dart';
import 'package:practida_daniel/pages/Page_Padding.dart';
import 'package:practida_daniel/pages/Page_Row.dart';
import 'package:practida_daniel/pages/Page_SingleChildScrollView.dart';
import 'package:practida_daniel/pages/Page_Text.dart';
import 'package:practida_daniel/pages/Page_Welcome.dart';
import 'package:practida_daniel/pages/Page_Scaffold.dart';
import 'package:practida_daniel/pages/Page_Container.dart';
import 'package:practida_daniel/pages/Page_GridView_builder.dart';


void main() {// entonces este mein solo es como un indice de las pantallas?
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GLOSARIO",
      initialRoute: "/Page_Welcome",// este es el inicio de la pagina la primera que mostrara?
      routes:{// por lo que entiendo este es como todas las ventanas que va a recorrer 
        "/Page_Welcome":(BuildContext context)=>Page_Welcome(),
        "/Page_Scaffold":(BuildContext context)=>Page_Scaffold(),
        "/Page_Container":(BuildContext context)=>Page_Container(),
        "/Page_AppBar":(BuildContext context)=>Page_AppBar(),
        "/Page_MaterialApp":(BuildContext context)=>Page_MaterialApp(),
        "/Page_Column":(BuildContext context)=>Page_Column(),
        "/Page_Image":(BuildContext context)=>Page_Image(),
        "/Page_Row":(BuildContext context)=>Page_Row(),
        "/Page_SingleChildScrollView":(BuildContext context)=>Page_SingleChildScrollView(),
        "/Page_Text":(BuildContext context)=>Page_Text(),
        "/Page_Card":(BuildContext context)=>Page_Card(),
        "/Page_ListTile":(BuildContext context)=>Page_ListTile(),
        "/Page_Padding":(BuildContext context)=>Page_Padding(),
        "/Page_GestureDetector":(BuildContext context)=>Page_GestureDetector(),
        "/Page_Navigator":(BuildContext context)=>Page_Navigator(),
        "/Page_Drawer":(BuildContext context)=>Page_Drawer(),
        "/Page_GridView_builder":(BuildContext context)=>Page_GridViewbuilder (),
        "/Page_GridView_count":(BuildContext context)=>Expam_GridView_count (),
      },
    );
  }
}

//"nombre_de_la_ruta": (BuildContext context) => NombreDeLaClaseDelWidget(),
/*
"/Page_GridViewbuilder" es el nombre de la ruta.
  Page_GridViewbuilder() es la instancia de la clase del widget 
  que se construirá y mostrará cuando se navegue a la ruta /Page_GridViewbuilder
*/