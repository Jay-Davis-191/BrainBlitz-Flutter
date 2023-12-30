import 'package:student_helper_flutter/navigation/nav_base_widget.dart';
import 'package:student_helper_flutter/widgets/landing_widget.dart';

import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Dashboard',
      content: [
        LandingWidget(),
      ],
    );
  }
}
