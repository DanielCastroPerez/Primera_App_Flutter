import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page_Column extends StatefulWidget {
  const Page_Column({super.key});

  @override
  State<Page_Column> createState() => _Page_ColumnState();
}

class _Page_ColumnState extends State<Page_Column> {
  @override
  Widget build(BuildContext context) {
    final widgetData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    //  CAMBIO: Corregido nombre de variable a camelCase para seguir buenas prácticas de estilo en Dart
    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              //  CAMBIO: Se usa interpolación de string en lugar de concatenación para mayor legibilidad
              "Como usar ${widgetData["nombre"]}",
              style: GoogleFonts.poppins(textStyle: styleDescripcion),
            ),
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widgetData["imagen"]),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                //  CAMBIO: Se elimina ClipRRect innecesario, ya que Card puede tener bordes redondeados directamente
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    6,
                  ), //  CAMBIO: Se usó BorderRadius directamente
                ),
                color: Colors.deepPurple[200],
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text(widgetData["nombre"]),
                      subtitle: Text(widgetData["descripcion"]),
                    ),
                    Divider(),
                    //  CAMBIO: Se reemplazó el Card interno por un Container, ya que no se requiere elevación ni sombra, solo fondo y bordes
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.code, color: Colors.white),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widgetData["codigo"],
                              style: GoogleFonts.poppins(textStyle: styleCode),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.import_contacts_rounded),
                      title: Text(
                        "Ejemplo propiedad",
                        style: GoogleFonts.poppins(textStyle: styleDescripcion),
                      ),
                      subtitle: Text(
                        "los widgets que puedes usar",
                        style: GoogleFonts.poppins(textStyle: styleDescripcion),
                      ),
                    ),

                    SizedBox(height: 30),
                    ...((widgetData["propiedades_detalladas"] as List<dynamic>)
                        .map((propiedades) {
                          return Column(
                            children: [
                              SizedBox(height: 24),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                color: Colors.deepPurple[200],
                                child: ListTile(
                                  leading: Icon(Icons.widgets),
                                  title: Text(propiedades["nombre"]),
                                  subtitle: Text(
                                    propiedades["descripcion_extendida"],
                                  ),
                                ),
                              ),

                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.all(8),
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
                          );
                        }).toList()),
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