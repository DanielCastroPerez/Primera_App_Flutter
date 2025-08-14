import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practida_daniel/pages/Code_example/Page_Example_GridView_count.dart';

class Page_GridView_count extends StatelessWidget {
  const Page_GridView_count({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widgetData["nombre"],
          style: GoogleFonts.poppins(textStyle: styleDescripcion),
        ),
        backgroundColor: Colors.green,
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Text(
                          widgetData["descripcion"],
                          style: GoogleFonts.poppins(
                            textStyle: styleDescripcion,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black87,
                          ),
                          child: Text(widgetData["codigo"]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[400],
                    ),
                    child: Text(
                      "MAS PROPIEDADES  DETALLADAS",
                      style: GoogleFonts.poppins(textStyle: styleDescripcion),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ...((widgetData["propiedades_detalladas"] as List<dynamic>)
                          .map((propiedades) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    propiedades["nombre"],
                                    style: GoogleFonts.poppins(
                                      textStyle: styleDescripcion,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    propiedades["descripcion_extendida"],
                                    style: GoogleFonts.poppins(
                                      textStyle: styleDescripcion,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.black87,
                                    ),
                                    child: Text(
                                      propiedades["ejemplo_propiedad"],
                                      style: GoogleFonts.poppins(
                                        textStyle: styleCode,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }))
                      .toList(),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Expam_GridView_count()));
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
