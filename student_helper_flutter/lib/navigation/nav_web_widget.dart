import 'package:student_helper_flutter/widgets/nav_app_bar.dart';
import 'package:student_helper_flutter/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

class WebNavigationWidget extends StatelessWidget {
  final List<Widget> content;
  final String title;

  const WebNavigationWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      drawer: const DrawerNavigationWidget(),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: content,
      ),
    );
  }
}
