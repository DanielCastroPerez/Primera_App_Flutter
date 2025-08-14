import 'package:flutter/material.dart';

class Expam_GridView_builder extends StatelessWidget {
  const Expam_GridView_builder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo GridView")),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0), 
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blueGrey,
            ),
          );
        },
      ),
    );
  }
}
