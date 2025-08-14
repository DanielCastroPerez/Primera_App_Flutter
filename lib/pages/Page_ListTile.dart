import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page_ListTile extends StatefulWidget {
  const Page_ListTile({super.key});

  @override
  State<Page_ListTile> createState() => _Page_ListTileState();
}

class _Page_ListTileState extends State<Page_ListTile> {
  @override
  Widget build(BuildContext context) {
    final widgetData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // hace que el apbar sea desplazante
            backgroundColor: Colors.brown,
            title: Text(
              " Como usar ${widgetData["nombre"]}",
              style: GoogleFonts.poppins(textStyle: styleDescripcion),
              textAlign: TextAlign.center,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widgetData["imagen"], fit: BoxFit.fill),
            ),
            expandedHeight:380
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(6),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text(
                        widgetData["nombre"],
                        style: GoogleFonts.poppins(textStyle: styleDescripcion),
                      ),
                      subtitle: Text(
                        widgetData["descripcion"],
                        style: GoogleFonts.poppins(textStyle: styleDescripcion),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black87,
                      ),
                      child: Text(
                        widgetData["codigo"],
                        style: GoogleFonts.poppins(textStyle: styleCode),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.lightGreenAccent,
                      ),
                      child: Text(
                        "Propiedades detalladas ",
                        style: GoogleFonts.poppins(textStyle: styleDescripcion),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 12),

                    ...((widgetData["propiedades_detalladas"] as List<dynamic>)
                        .map((propiedades) {
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.widgets),
                                  title: Text(
                                    propiedades["nombre"],
                                    style: GoogleFonts.poppins(
                                      textStyle: styleDescripcion,
                                    ),
                                  ),
                                  subtitle: Text(
                                    propiedades["descripcion_extendida"],
                                    style: GoogleFonts.poppins(
                                      textStyle: styleDescripcion,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.black87,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.code, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          propiedades["ejemplo_propiedad"],
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
                        })
                        .toList()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
