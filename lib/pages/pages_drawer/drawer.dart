import 'package:flutter/material.dart';
import 'package:practida_daniel/pages/pages_drawer/drawer_page2.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: Container(
        color: Colors.deepPurple[100],
        child: ListView(
          children: [
            // cabecera
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[50]),
              child: Center(
                child: Text("LOGO DE CABEZERA", style: TextStyle(fontSize: 35)),
              ),
            ),
            // lista de elementos dentro de la barra lateral
            ListTile(
              leading: Icon(Icons.home),
              title: Text("pagina 1"),
              onTap: () {
                Navigator.of(context).pushNamed("/drawer_page1");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text("Pafina 2"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DrawerPage2()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
