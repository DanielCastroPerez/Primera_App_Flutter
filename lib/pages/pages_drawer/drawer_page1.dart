import 'package:flutter/material.dart';

class DrawerPage1 extends StatelessWidget {
  const DrawerPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Page 1'),
      backgroundColor: Colors.blue[100],
      elevation: 10,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Text('Hola soy el drawer page 1')
        )
      )
    );
  }
}