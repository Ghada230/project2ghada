import 'package:flutter/material.dart';
import 'package:untitled/Student.dart';

class StudentsDetails extends StatelessWidget {
  final StudentsName Namestudents;

  const StudentsDetails({super.key, required this.Namestudents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(Namestudents.name,style:
        TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),

            ],
          ),
        ),

        child: Center(

          child: Column(

            children: [
              SizedBox(height: 30.0),
              Image.network(Namestudents.ImageUrl),
              SizedBox(height: 20.0),
              Text(Namestudents.desc)],
          ),
        ),
      ),
    );
  }
}