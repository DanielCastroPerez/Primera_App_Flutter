import 'package:flutter/material.dart';

class ExamplebottomNavigationBar extends StatefulWidget {
  const ExamplebottomNavigationBar({super.key});

  @override
  State<ExamplebottomNavigationBar> createState() =>
      _ExamplebottomNavigationBarState();
}

class _ExamplebottomNavigationBarState
    extends State<ExamplebottomNavigationBar> {

  // Guarda qué ítem del BottomNavigationBar está seleccionado (por defecto el 0: "Home")
  int _selectedIndex = 0;

  // Cambia la pantalla visible cuando se presiona un ícono
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ✅ Lista de páginas a mostrar según el ícono seleccionado
  final List<Widget> _pages = [
    Center(child: Text("Home page", style: TextStyle(fontSize: 50))),
    Center(child: Text("Message page", style: TextStyle(fontSize: 50))),
    Center(child: Text("Settings page", style: TextStyle(fontSize: 50))),
    Center(child: Text("Account page", style: TextStyle(fontSize: 50))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Muestra la página correspondiente según el índice seleccionado
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        // Índice actual seleccionado
        currentIndex: _selectedIndex,
        // Se llama cuando se toca un ícono
        onTap: _navigateBottomBar,
        // Esto evita que los íconos se animen o cambien de tamaño
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue, // Color del ícono y texto seleccionados
        unselectedItemColor: Colors.grey, // Color de los íconos no seleccionados
        // Lista de ítems del BottomNavigationBar
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
