import 'package:flutter/material.dart';
import 'customtextfield.dart';
class ForgetPasswordPage extends StatelessWidget {
  final labelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final hintStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    if (MediaQuery
        .of(context)
        .orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          ' Forget Password ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
          child: Flexible(child:
          Center(
            child: Column(
              children: [
                // SignupCard(),
                const SizedBox(height: 100),
                CustomTextField(
                  text: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.text,
                ),


                // Reset Password Button
                Padding(

                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: screenWidth * 0.2,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Show an alert when the button is pressed
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Reset Password'),
                                content: Text(
                                    'Password reset instructions sent to your email.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
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
                          'RESET PASSWORD',
                          style: TextStyle(
                            color: Color(0xFF527DAA),
                            letterSpacing: 5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
