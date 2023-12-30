import 'package:flutter/material.dart';
import 'package:student_helper_flutter/widgets/title_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleWidget(
      isLoggedIn: false, 
    );
  }
}