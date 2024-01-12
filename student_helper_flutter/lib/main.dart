import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_helper_flutter/models/user.dart';
import 'package:student_helper_flutter/screens/screen_countdown.dart';
import 'package:student_helper_flutter/screens/screen_landing.dart';
import 'package:student_helper_flutter/screens/screen_login.dart';
import 'package:student_helper_flutter/screens/screen_reminder.dart';
import 'package:student_helper_flutter/screens/screen_signup.dart';
import 'package:student_helper_flutter/screens/screen_welcome.dart';
import 'package:student_helper_flutter/screens/screen_flashcard.dart';
import 'package:http/http.dart' as http; 

// late User? user; Necessary for User to work after login. Delete the line below once you reactivate this line
User user = User('Jay', 'test@gmail.com');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Helper Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true, 

        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
      ),
      // Start Route
      initialRoute: '/landing',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/landing': (context) => const LandingScreen(),
        '/flashcards': (context) => FlashcardScreen(user: user),
        '/reminders': (context) => ReminderScreen(),
        '/countdown': (context) => CountdownScreen(),

      }
    );
  }
}