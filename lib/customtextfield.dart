import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust as needed
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFF6CA8F1),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            height: 60.0,
            child: TextField(

              controller: controller,
              keyboardType: keyboardType,
              obscureText: isPassword ? obscureText : false,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',

              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14.0),
                hintText: 'Enter your $text',
                hintStyle: const TextStyle(
                  color: Colors.white54,
                  fontFamily: 'OpenSans',

                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}