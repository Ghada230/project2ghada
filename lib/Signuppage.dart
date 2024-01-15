import 'package:flutter/material.dart';
import 'customtextfield.dart';
import 'signupbutton.dart';
class SignUppage extends StatelessWidget {
  final labelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final hintStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          ' Sign Up ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
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
        child: SafeArea(
          child: Flexible (child:
          Center(
            child: Column(
              children: [
                // SignupCard(),
                const SizedBox(height: 5),
                CustomTextField(
                  text: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  text: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.text,),
                const SizedBox(height: 5),
                CustomTextField(
                  text: 'Password',
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  text: 'Confirm Password',
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                const MyButton1()


              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}