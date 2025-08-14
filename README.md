
## Instalación de la librería `google_fonts`

Para usar **google\_fonts**, debes agregar la siguiente dependencia en tu archivo **pubspec.yaml**:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^2.1.0
```

Luego, ejecuta el siguiente comando en la terminal para instalar las dependencias:

```bash
flutter pub get
```

Para utilizar la librería, impórtala en tu archivo **main.dart**:

```dart
import 'package:google_fonts/google_fonts.dart';
```

### Ejemplo de uso

```dart
Text(
  'Hola Mundo',
  style: GoogleFonts.lato(
    color: Colors.red,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
)
```

---

## Pasos para cargar archivos JSON

1. Dentro de la carpeta **assets**, crea una carpeta llamada **data**.
2. Agrega tu archivo JSON en la carpeta **data** con el nombre **widgets.json**.
3. En tu archivo **pubspec.yaml**, dentro de `flutter:`, agrega lo siguiente:

   ```yaml
   assets:
     - assets/data/widgets.json
   ```
4. En tu archivo **main.dart**, añade el siguiente código para cargar los datos del JSON:

   ```dart
   Future<Widget> _getData() async {
     final response = await http.get(Uri.parse('assets/data/widgets.json'));
     final data = jsonDecode(response.body);
     return data;
   }
   ```
