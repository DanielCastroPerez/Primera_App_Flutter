import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// CLASE PRINCIPAL QUE MUESTRA UN EJEMPLO DEL WIDGET SCAFFOLD
class Page_Scaffold extends StatelessWidget {
  const Page_Scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetData = ModalRoute.of(context)!.settings.arguments as Map;
    final styleDescripcion = TextStyle(fontSize: 20.0);
    final styleCode = TextStyle(fontFamily: "monospace", color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('widget Scaffold'),
        backgroundColor: Colors.blue,
        elevation: 10,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: widgetData["imagen"] != null
                  ? Image.asset(widgetData["imagen"], fit: BoxFit.fill)
                  : SizedBox.shrink(), // O puedes usar un Container() vacío, o un placeholder
            ),
            Column(
              children: [
                Card(
                  // ✅ CAMBIO: Se usó Card en lugar de Container para mantener consistencia con Material Design y obtener sombra automática
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          widgetData["descripcion"],
                          style: GoogleFonts.poppins(
                            textStyle: styleDescripcion,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          // ✅ BIEN: Container usado para mostrar código con estilo personalizado
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            widgetData['codigo'],
                            style: GoogleFonts.poppins(textStyle: styleCode),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(height: 20),

            ...((widgetData["propiedades_detalladas"] as List<dynamic>).map((
              propiedades,
            ) {
              return Column(
                children: [
                  SizedBox(height: 24),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        6,
                      ), // ✅ CAMBIO: Usar BorderRadius directamente sin BorderRadiusGeometry
                    ),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.account_tree_rounded),
                          title: Text(propiedades["nombre"]),
                          subtitle: Text(propiedades["descripcion_extendida"]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.black87,
                          ),
                          padding: EdgeInsets.all(
                            8,
                          ), // ✅ CAMBIO: Agregado padding para separar el código del borde
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.code, color: Colors.white),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  propiedades["ejemplo_propiedad"], // ✅ CAMBIO: Usar el ejemplo correcto, no el código general
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
                  ),
                ],
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
