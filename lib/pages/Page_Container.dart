import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page_Container extends StatelessWidget {
  const Page_Container({super.key});

  @override
  Widget build(BuildContext context) {

    final widgetData =ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Widget ${widgetData["nombre"]}"),
        elevation: 10.0,
        backgroundColor: Colors.cyanAccent,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //CONTEINER DE IMAGEN
              alignment: Alignment.center, // centro la imagen
              margin: EdgeInsets.only(bottom: 20.0),
              child: Image.asset(widgetData["imagen"], fit: BoxFit.fill),
            ),

            Container(
              //CONTEINER DE EXPLICACION DEL WIDGET
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(widgetData["descripcion"],style : GoogleFonts.poppins(textStyle: styleDescripcion)),
            ),

            Container(
              //CONTEINER DE EJEMPLO DEL WIDGET
              padding: EdgeInsets.all(10.0),

              decoration: BoxDecoration(
                //AQLUI SOLO SE USA PARAMODIFICAR COLOR Y RADIO
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),

              child: Text(widgetData["codigo"],style:GoogleFonts.poppins(textStyle: styleCode),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
