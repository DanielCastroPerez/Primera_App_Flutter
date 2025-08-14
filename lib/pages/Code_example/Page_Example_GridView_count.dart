import 'package:flutter/material.dart';

// ignore: camel_case_types
class Expam_GridView_count extends StatelessWidget {
  const Expam_GridView_count({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
