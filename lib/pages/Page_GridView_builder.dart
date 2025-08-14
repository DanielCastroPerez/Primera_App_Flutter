import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practida_daniel/pages/Code_example/Page_Example_GridView_builder.dart';

class Page_GridViewbuilder extends StatefulWidget {
  const Page_GridViewbuilder({super.key});

  @override
  State<Page_GridViewbuilder> createState() => _GridView_builderState();
}

class _GridView_builderState extends State<Page_GridViewbuilder> {
  @override
  Widget build(BuildContext context) {
    final widgetData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo GridView"),
      backgroundColor: Colors.deepOrangeAccent,
      elevation: 10),
      backgroundColor: Colors.deepPurple[300],
      body: CustomScrollView(
        slivers: [
          //slivers es un widget que permite agrupar varios widgets en una sola vista
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
                          child: Text(
                            widgetData["codigo"],
                            style: GoogleFonts.poppins(textStyle: styleCode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Container para Texto  propiedades detalladas
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
                  SizedBox(height: 30.0), // Espacio antes del botón
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Expam_GridView_builder(),
                        ),
                      );
                    },
                    icon: Icon(Icons.code),
                    label: Text("Ver página de ejemplo"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0), // Espacio inferior extra
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
