import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final bool isLoggedIn;

  // Constructor and logged in status
  const TitleWidget({super.key, required this.isLoggedIn});

  // Buttons for login and signup
  Widget _buildButton(BuildContext context, routeName, buttonLabel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(buttonLabel),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // Background Image
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_student.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Logo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img_logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              // Butons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(context, '/login', 'Login'),
                  _buildButton(context, '/signUp', 'Sign Up'),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
