import 'package:flutter/material.dart';
import 'package:student_helper_flutter/widgets/countdown_widget.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Math Game'),
      ),
      body: Center(
        child: CountdownWidget(),
      ),
    );
  }
}
