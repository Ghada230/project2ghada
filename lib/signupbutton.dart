import 'package:flutter/material.dart';
import 'loginpage.dart';

class MyButton1 extends StatelessWidget {
  const MyButton1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: Colors.white,
      ),
      child: Text(
        'SIGN UP',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }
}