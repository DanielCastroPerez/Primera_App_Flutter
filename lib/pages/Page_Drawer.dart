import 'package:flutter/material.dart';
import 'package:practida_daniel/pages/pages_drawer/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Page_Drawer extends StatelessWidget {
  const Page_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      drawer: const AppDrawer(), // ya no es Scaffold
      body: CustomScrollView(
        slivers: [
          //slivers es un widget que permite agrupar varios widgets en una sola vista
          SliverAppBar(
            // sliverappbar MUESTRA LA BARRITA DE NAVEGACION
            backgroundColor: Colors.grey[200],
            expandedHeight: 300,
            title: Text("Como usar drawer"),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(widgetData['imagen'], fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  // CHILDREN PARA CONTAINER INDEPENDIENTES
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // CHILDREN PARA EXPLICACION PRINCIPAL
                        Text(
                          widgetData["descripcion"],
                          style: GoogleFonts.poppins(
                            textStyle: styleDescripcion,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(widgetData["codigo"],style: GoogleFonts.poppins(textStyle: styleCode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "MAS PROPIEDADES  DETALLADAS",
                      style: GoogleFonts.poppins(textStyle: styleDescripcion),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  ...((widgetData["propiedades_detalladas"] as List<dynamic>).map((
                    propiedades,
                  ) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  propiedades["nombre"],
                                  style: GoogleFonts.poppins(
                                    textStyle: styleDescripcion,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  propiedades["descripcion_extendida"],
                                  style: GoogleFonts.poppins(
                                    textStyle: styleDescripcion,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    propiedades["ejemplo_propiedad"], // COMO HAGO QUE ESTE TEXT TOME TODO EL ANCHO DEL CONTENEDOR
                                    style: GoogleFonts.poppins(
                                      textStyle: styleCode,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
