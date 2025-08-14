import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Allowed packages:
// - provider: 6.1.5

// Data Models
class PropiedadDetallada {
  final String nombre;
  final String tipo;
  final String descripcionExtendida;
  final String ejemploPropiedad;

  PropiedadDetallada({
    required this.nombre,
    required this.tipo,
    required this.descripcionExtendida,
    required this.ejemploPropiedad,
  });

  factory PropiedadDetallada.fromJson(Map<String, dynamic> json) {
    return PropiedadDetallada(
      nombre: json['nombre'] as String,
      tipo: json['tipo'] as String,
      descripcionExtendida: json['descripcion_extendida'] as String,
      ejemploPropiedad: json['ejemplo_propiedad'] as String,
    );
  }
}

class WidgetInfo {
  final String nombre;
  final String descripcion;
  final List<PropiedadDetallada> propiedadesDetalladas;
  final List<String> usosComunes;
  final List<String> constructoresComunes;
  final List<String> widgetsRelacionados;
  final String cuandoNoUsar;
  final String codigo;
  final String imagen; // Will be a URL

  WidgetInfo({
    required this.nombre,
    required this.descripcion,
    required this.propiedadesDetalladas,
    required this.usosComunes,
    required this.constructoresComunes,
    required this.widgetsRelacionados,
    required this.cuandoNoUsar,
    required this.codigo,
    required this.imagen,
  });

  factory WidgetInfo.fromJson(Map<String, dynamic> json) {
    return WidgetInfo(
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String,
      propiedadesDetalladas: (json['propiedades_detalladas'] as List<dynamic>)
          .map<PropiedadDetallada>(
              (dynamic e) => PropiedadDetallada.fromJson(e as Map<String, dynamic>))
          .toList(),
      usosComunes: (json['usos_comunes'] as List<dynamic>)
          .map<String>((dynamic e) => e as String)
          .toList(),
      constructoresComunes: (json['constructores_comunes'] as List<dynamic>)
          .map<String>((dynamic e) => e as String)
          .toList(),
      widgetsRelacionados: (json['widgets_relacionados'] as List<dynamic>)
          .map<String>((dynamic e) => e as String)
          .toList(),
      cuandoNoUsar: json['cuando_no_usar'] as String,
      codigo: json['codigo'] as String,
      imagen: json['imagen'] as String,
    );
  }
}

// State Management
class WidgetDataNotifier extends ChangeNotifier {
  final List<WidgetInfo> _widgets;

  WidgetDataNotifier()
      : _widgets = [
          WidgetInfo.fromJson({
            "nombre": "Padding",
            "descripcion":
                "Un widget fundamental en Flutter que inserta espacio vacío alrededor de su 'child' (hijo). Permite controlar el espaciado interno de un widget, empujando su contenido lejos de sus bordes.",
            "propiedades_detalladas": [
              {
                "nombre": "padding",
                "tipo": "EdgeInsetsGeometry",
                "descripcion_extendida":
                    "Define la cantidad de espacio vacío que se debe aplicar alrededor del 'child'. Puedes especificar un valor uniforme, solo para ciertos lados, o para lados horizontales/verticales.",
                "ejemplo_propiedad":
                    "Padding(\n  padding: const EdgeInsets.all(16.0), // Padding uniforme de 16px\n  child: Text('Con padding de 16'),\n)\n\nPadding(\n  padding: const EdgeInsets.only(left: 8.0, top: 4.0), // Padding solo a la izquierda y arriba\n  child: Text('Con padding específico'),\n)\n\nPadding(\n  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding horizontal\n  child: Text('Con padding horizontal'),\n)"
              },
              {
                "nombre": "child",
                "tipo": "Widget",
                "descripcion_extendida":
                    "El widget al que se le aplicará el padding. El espacio definido por `padding` se agregará alrededor de este widget.",
                "ejemplo_propiedad":
                    "Padding(\n  padding: const EdgeInsets.all(8.0),\n  child: Container(\n    color: Colors.blue,\n    width: 100,\n    height: 100,\n  ),\n)"
              }
            ],
            "usos_comunes": [
              "Crear espacio entre widgets en un `Column`, `Row` o `Stack`.",
              "Ajustar la separación de un widget respecto a los bordes de la pantalla o de su contenedor padre.",
              "Mejorar la legibilidad y la estética de la interfaz de usuario."
            ],
            "constructores_comunes": [
              "Padding({Key? key, required EdgeInsetsGeometry padding, Widget? child})"
            ],
            "widgets_relacionados": [
              "SizedBox",
              "Container",
              "Margin (aunque `Container` con `margin` es el equivalente común)"
            ],
            "cuando_no_usar":
                "No uses `Padding` si el espaciado es parte inherente del diseño de un widget personalizado (donde podrías dibujar el padding directamente). Para espaciados simples entre elementos en un `Row` o `Column`, a veces `SizedBox` con `width` o `height` puede ser una alternativa más explícita.",
            "codigo":
                "Padding(\n  padding: const EdgeInsets.all(12.0),\n  child: Text(\n    'Este texto tiene padding por todos lados.',\n    style: TextStyle(fontSize: 18),\n  ),\n);",
            "imagen":
                "https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg", // Placeholder image URL
          }),
          WidgetInfo.fromJson({
            "nombre": "Column",
            "descripcion":
                "Un widget que muestra sus hijos en una secuencia vertical. `Column` es uno de los widgets de layout más comunes y fundamentales en Flutter para organizar elementos verticalmente.",
            "propiedades_detalladas": [
              {
                "nombre": "children",
                "tipo": "List<Widget>",
                "descripcion_extendida":
                    "La lista de widgets que se mostrarán en la columna, uno debajo del otro. Los widgets se colocan en el orden en que aparecen en la lista.",
                "ejemplo_propiedad":
                    "Column(\n  children: <Widget>[\n    Text('Primer elemento'),\n    Text('Segundo elemento'),\n    Icon(Icons.star),\n  ],\n)"
              },
              {
                "nombre": "mainAxisAlignment",
                "tipo": "MainAxisAlignment",
                "descripcion_extendida":
                    "Define cómo los hijos se alinean a lo largo del eje principal (vertical). Ejemplos: `start`, `center`, `end`, `spaceBetween`, `spaceAround`, `spaceEvenly`.",
                "ejemplo_propiedad":
                    "Column(\n  mainAxisAlignment: MainAxisAlignment.center,\n  children: <Widget>[\n    Text('Centrado verticalmente'),\n    ElevatedButton(onPressed: () {}, child: Text('Botón'))\n  ],\n)"
              },
              {
                "nombre": "crossAxisAlignment",
                "tipo": "CrossAxisAlignment",
                "descripcion_extendida":
                    "Define cómo los hijos se alinean a lo largo del eje transversal (horizontal). Ejemplos: `start`, `center`, `end`, `stretch`, `baseline`.",
                "ejemplo_propiedad":
                    "Column(\n  crossAxisAlignment: CrossAxisAlignment.stretch,\n  children: <Widget>[\n    Container(width: 50, height: 50, color: Colors.red),\n    Container(width: 100, height: 50, color: Colors.green),\n  ],\n)"
              },
              {
                "nombre": "mainAxisSize",
                "tipo": "MainAxisSize",
                "descripcion_extendida":
                    "Determina cuánto espacio debe ocupar la columna en el eje principal (vertical). `MainAxisSize.max` ocupa todo el espacio disponible, `MainAxisSize.min` solo el espacio necesario para sus hijos.",
                "ejemplo_propiedad":
                    "Column(\n  mainAxisSize: MainAxisSize.min,\n  children: <Widget>[\n    Text('Solo ocupa el espacio necesario'),\n    Icon(Icons.check_circle),\n  ],\n)"
              }
            ],
            "usos_comunes": [
              "Apilar varios widgets verticalmente.",
              "Organizar contenido en formularios.",
              "Crear diseños de lista simples."
            ],
            "constructores_comunes": [
              "Column({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})"
            ],
            "widgets_relacionados": [
              "Row",
              "Flex",
              "ListView",
              "SingleChildScrollView"
            ],
            "cuando_no_usar":
                "No uses `Column` si necesitas desplazamiento para muchos elementos; en su lugar, considera `ListView`. Para elementos que deben expandirse para llenar el espacio, usa `Expanded` dentro de la `Column`. No uses `Column` si solo necesitas mostrar un único widget grande que ya gestiona su propio layout.",
            "codigo":
                "Column(\n  mainAxisAlignment: MainAxisAlignment.spaceEvenly,\n  crossAxisAlignment: CrossAxisAlignment.center,\n  children: <Widget>[\n    Container(width: 100, height: 50, color: Colors.blueAccent),\n    Text('Hola, Flutter!'),\n    ElevatedButton(\n      onPressed: () {},\n      child: const Text('Botón'),\n    ),\n  ],\n);",
            "imagen":
                "https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg", // Placeholder image URL
          }),
          WidgetInfo.fromJson({
            "nombre": "Row",
            "descripcion":
                "Un widget que muestra sus hijos en una secuencia horizontal. `Row` es esencial para organizar elementos uno al lado del otro en el layout de Flutter.",
            "propiedades_detalladas": [
              {
                "nombre": "children",
                "tipo": "List<Widget>",
                "descripcion_extendida":
                    "La lista de widgets que se mostrarán en la fila, uno al lado del otro. Los widgets se colocan en el orden en que aparecen en la lista.",
                "ejemplo_propiedad":
                    "Row(\n  children: <Widget>[\n    Text('Primer elemento'),\n    Icon(Icons.home),\n    Text('Tercer elemento'),\n  ],\n)"
              },
              {
                "nombre": "mainAxisAlignment",
                "tipo": "MainAxisAlignment",
                "descripcion_extendida":
                    "Define cómo los hijos se alinean a lo largo del eje principal (horizontal). Ejemplos: `start`, `center`, `end`, `spaceBetween`, `spaceAround`, `spaceEvenly`.",
                "ejemplo_propiedad":
                    "Row(\n  mainAxisAlignment: MainAxisAlignment.spaceBetween,\n  children: <Widget>[\n    Icon(Icons.arrow_back),\n    Text('Título'),\n    Icon(Icons.arrow_forward),\n  ],\n)"
              },
              {
                "nombre": "crossAxisAlignment",
                "tipo": "CrossAxisAlignment",
                "descripcion_extendida":
                    "Define cómo los hijos se alinean a lo largo del eje transversal (vertical). Ejemplos: `start`, `center`, `end`, `stretch`, `baseline`.",
                "ejemplo_propiedad":
                    "Row(\n  crossAxisAlignment: CrossAxisAlignment.center,\n  children: <Widget>[\n    Text('Alineado al centro'),\n    Container(width: 50, height: 100, color: Colors.blue),\n  ],\n)"
              },
              {
                "nombre": "mainAxisSize",
                "tipo": "MainAxisSize",
                "descripcion_extendida":
                    "Determina cuánto espacio debe ocupar la fila en el eje principal (horizontal). `MainAxisSize.max` ocupa todo el espacio disponible, `MainAxisSize.min` solo el espacio necesario para sus hijos.",
                "ejemplo_propiedad":
                    "Row(\n  mainAxisSize: MainAxisSize.min,\n  children: <Widget>[\n    Text('Solo ocupa el espacio necesario'),\n    Icon(Icons.info),\n  ],\n)"
              }
            ],
            "usos_comunes": [
              "Colocar widgets uno al lado del otro.",
              "Crear barras de herramientas o navegación horizontal.",
              "Diseñar encabezados o pies de página con múltiples elementos."
            ],
            "constructores_comunes": [
              "Row({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})"
            ],
            "widgets_relacionados": [
              "Column",
              "Flex",
              "Wrap",
              "Expanded"
            ],
            "cuando_no_usar":
                "No uses `Row` si los elementos necesitan envolver automáticamente a la siguiente línea cuando no hay suficiente espacio; en ese caso, considera `Wrap`. Ten cuidado con los 'overflows' cuando los hijos de una `Row` tienen un ancho fijo y el espacio disponible es limitado; usa `Expanded` o `Flexible` para manejar el desbordamiento.",
            "codigo":
                "Row(\n  mainAxisAlignment: MainAxisAlignment.spaceAround,\n  crossAxisAlignment: CrossAxisAlignment.center,\n  children: <Widget>[\n    Icon(Icons.photo, size: 48, color: Colors.deepOrange),\n    Text('Galería'),\n    Icon(Icons.camera_alt, size: 48, color: Colors.green),\n  ],\n);",
            "imagen":
                "https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg", // Placeholder image URL
          }),
        ];

  List<WidgetInfo> get widgets => _widgets;
}

// Main Application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WidgetDataNotifier>(// manda a llamar a la clase WidgetDataNotifier que contiene la informacion y avisa de los cambios, MultiProvider, provider? , devo de crear siempre una clase extendiendo de ChangeNotifier cuando ?
      create: (BuildContext context) => WidgetDataNotifier(),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Aprende Widgets Básicos',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.amberAccent,
            ),
            scaffoldBackgroundColor: Colors.deepPurple.shade50,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              elevation: 4.0,
            ),
            cardTheme: CardThemeData(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            textTheme: TextTheme(
              displayLarge: TextStyle(
                  color: Colors.deepPurple.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              headlineSmall: TextStyle(
                  color: Colors.deepPurple.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              titleLarge: TextStyle(
                  color: Colors.deepPurple.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              bodyLarge: TextStyle(color: Colors.grey.shade900, fontSize: 16),
              bodyMedium: TextStyle(color: Colors.grey.shade700, fontSize: 14),
              labelLarge: const TextStyle(color: Colors.white),
            ),
            // For code snippets
            fontFamily: 'monospace',
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WidgetDataNotifier widgetData =
        Provider.of<WidgetDataNotifier>(context);
    final List<WidgetInfo> widgets = widgetData.widgets;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Fundamentales de Flutter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.9,
          ),
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return WidgetCard(widgetInfo: widgets[index]);
          },
        ),
      ),
    );
  }
}

// Widget Card for Home Screen
class WidgetCard extends StatelessWidget {
  final WidgetInfo widgetInfo;

  const WidgetCard({
    required this.widgetInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<WidgetDetailScreen>(
              builder: (BuildContext context) =>
                  WidgetDetailScreen(widgetInfo: widgetInfo),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.network(
                  widgetInfo.imagen,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 48,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widgetInfo.nombre,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    // Wrap the description text with Expanded to ensure it takes
                    // remaining space and prevents overflow within this inner Column.
                    Expanded(
                      child: Text(
                        widgetInfo.descripcion,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Detail Screen
class WidgetDetailScreen extends StatelessWidget {
  final WidgetInfo widgetInfo;

  const WidgetDetailScreen({
    required this.widgetInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetInfo.nombre),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  widgetInfo.imagen,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Descripción General',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            Text(
              widgetInfo.descripcion,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Propiedades Detalladas',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            ...widgetInfo.propiedadesDetalladas
                .map<Widget>((PropiedadDetallada prop) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${prop.nombre} (${prop.tipo})',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      prop.descripcionExtendida,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Ejemplo de uso:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 4.0),
                    CodeBlock(code: prop.ejemploPropiedad),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 24.0),
            Text(
              'Usos Comunes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            ...widgetInfo.usosComunes.map<Widget>((String use) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(Icons.check,
                        size: 18, color: Colors.green),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        use,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 24.0),
            Text(
              'Constructores Comunes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            ...widgetInfo.constructoresComunes.map<Widget>((String ctor) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: CodeBlock(code: ctor),
              );
            }).toList(),
            const SizedBox(height: 24.0),
            Text(
              'Widgets Relacionados',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: widgetInfo.widgetsRelacionados
                  .map<Widget>((String related) {
                return Chip(
                  label: Text(related),
                  backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Cuando NO usar ${widgetInfo.nombre}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            Text(
              widgetInfo.cuandoNoUsar,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Código de Ejemplo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            CodeBlock(code: widgetInfo.codigo),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for displaying code blocks
class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock({
    required this.code,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          color: Colors.white,
          fontSize: 14.0,
        ),
      ),
    );
  }
}