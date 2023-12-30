import 'package:flutter/material.dart';
import 'package:student_helper_flutter/widgets/nav_app_bar.dart';
import '../widgets/nav_bottom_bar.dart';

class MobileNavigationWidget extends StatelessWidget {
  final List<Widget> content;
  final String title;

  const MobileNavigationWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: content,
      ),
      bottomNavigationBar: const MobileBottomNavBar(),
    );
  }
}
