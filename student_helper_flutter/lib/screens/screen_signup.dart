import 'package:flutter/material.dart';
import 'package:student_helper_flutter/utils/responsive_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool validate = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResponsiveLayout.isMobileScreen(context)
              ? const SizedBox()
              : Expanded(
                  // Left side of screen
                  child: Container(
                    height: height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img_classroom.png'),
                          fit: BoxFit.fill),
                    ),
                    child: const Center(
                      child: Text(
                        'Student Helper',
                        style: TextStyle(
                            fontSize: 48.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

          // Right side of screen
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Sign up',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 52.0),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sign up and explore your new school journey!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'First name',
                            errorText:
                                validate ? 'Please enter first name' : null),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: _firstNameController,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Last name',
                            errorText:
                                validate ? 'Please enter last name' : null),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: _lastNameController,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Email',
                            errorText: validate ? 'Please enter email' : null),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Enter password',
                            errorText:
                                validate ? 'Please enter password' : null),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Confirm password',
                            errorText:
                                validate ? 'Please enter password' : null),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: _confirmPasswordController,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                        title: const Text('Sign up complete!'),
                                        content: const Text(
                                            'Adventurer!\nYou\'re account has been created.\nTime to login and explore!'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                      context, '/login'),
                                              child: const Text('Okay'))
                                        ],
                                      )));
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 5,
                              minimumSize: const Size.fromHeight(50)),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
