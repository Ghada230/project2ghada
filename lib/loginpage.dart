import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'forgetpage.dart';
import 'Signuppage.dart';
import 'customtextfield.dart';
import 'logedinpage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

void openlogin(BuildContext context) {
  try {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  looginpage(),
        settings: const RouteSettings(),
      ),
    );
  } catch (e) {
    print('Error navigating to the second page: $e');
  }
}
bool _obscurePassword=true;

void openforgetpassword(BuildContext context) {
  try {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ForgetPasswordPage(),
        settings: const RouteSettings(),
      ),
    );
  } catch (e) {
    print('Error navigating to the reset page: $e');
  }
}

void opensignupp(BuildContext context) {
  try {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUppage(),
        settings: const RouteSettings(),
      ),
    );
  } catch (e) {
    print('Error navigating to the signup page: $e');
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          ' Sign In ',
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
        decoration: const BoxDecoration(
          /* image : DecorationImage(
           image: NetworkImage('data:image/jpeg;base64,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'
               '0+xEAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREA/9k='),
          fit: BoxFit.fitHeight,),*/

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
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                // Logo and other widgets
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your logo image here
                    Container(
                      child:
                      Image.network(
                        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQVFRISFRISGBUYGhgcGBwYEhoYGRkcGBocG'
                            'RgYGBgcIS8lHB4sHxoZJjgmKy8xNjU1GiU7QDszPy40NTEBDAwMEA8QHhISHjQsJCU0PzQxNDE9MTQ0NDQ0N'
                            'TQ0NDQ0MTQ0NDQ0NDQ0NDQ0NDQ0NDE0NDQ0NDQ0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAbAAE'
                            'AAgMBAQAAAAAAAAAAAAAABAUCAwYHAf/EAEUQAAIBAgMEBwQGBQwDAQAAAAECAAMRBBIhBTFBUQYTImFxg'
                            'bEykaHBFEJSYnLRFSMzgrIHNFNjc3R1hJKT4fCDs/Ek/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAECAwQF/8QAK'
                            'REAAgICAgECBAcAAAAAAAAAAAECESExAxJBUWEEFDKREyJCcYGhsf/aAAwDAQACEQMRAD8A9kiIkkiIiAIiIA'
                            'iIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiJiGGouNN'
                            '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'
                            '0+xEAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREA/9k=',
                        height: screenWidth*0.1,
                        width: screenWidth*0.1,
                      ),
                    ),

                    CustomTextField(
                      text: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    SizedBox(height: 1.0),
                    CustomTextField(
                      text: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      obscureText: true,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => openforgetpassword(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.329999),
                      child: Container(
                        height: 20.0,
                        child: Row(
                          children: <Widget>[
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: _rememberMe,
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: screenWidth * 0.2,
                      ),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                openlogin(context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Please enter both username and password.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the alert
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Colors.white,
                            ),
                            child: Text(
                              'LOGIN',
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => print('Login with Facebook'),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Image.network(
                                'https://www.facebook.com/images/fb_icon_325x325.png',
                                height: 50,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print('Login with Google'),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_'
                                    '2022%29.svg/1200px-Google_Chrome_icon_%28February_2022%29.svg.png',
                                height: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an Account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => opensignupp(context),
                          child: const MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4),
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}