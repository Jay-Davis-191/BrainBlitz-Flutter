
import 'package:flutter/material.dart';
import 'dart:math';

class CountdownWidget extends StatefulWidget {
  final int requiredNumber; 
  final List<int> setNumbers; 
  final VoidCallback onShowSolution; 
  final VoidCallback onRestartNumbers; 
  final VoidCallback onSkip; 

  CountdownWidget ({
    required this.requiredNumber, 
    required this.setNumbers, 
    required this.onShowSolution, 
    required this.onRestartNumbers, 
    required this.onSkip,
  });

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: widget.onRestartNumbers,
              child: Text('Restart'),
            ),
            ElevatedButton(
              onPressed: widget.onSkip,
              child: Text('Pass'),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Required Number:${widget.requiredNumber}',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          ElevatedButton(
            onPressed: widget.onSkip,
            child: Text(widget.setNumbers.elementAt(0).toString()),
            ),
          ElevatedButton(
            onPressed: widget.onSkip,
            child: Text(widget.setNumbers.elementAt(1).toString()),
            ),
          ElevatedButton(
            onPressed: widget.onSkip,
            child: Text(widget.setNumbers.elementAt(2).toString()),
            ),
          ElevatedButton(
            onPressed: widget.onSkip,
            child: Text(widget.setNumbers.elementAt(3).toString()),
            ),
          ElevatedButton(
            onPressed: widget.onSkip,
            child: Text(widget.setNumbers.elementAt(4).toString()),
            ),
          ElevatedButton(
            onPressed: widget.onSkip,
            child: Text(widget.setNumbers.elementAt(5).toString()),
            ),  
          ]
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: widget.onSkip, // This will be changed later to include the operator once selected
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: widget.onSkip, // This will be changed later to include the operator once selected
              child: const Text('-'),
            ),
            ElevatedButton(
              onPressed: widget.onSkip, // This will be changed later to include the operator once selected
              child: const Text('x'),
            ),
            ElevatedButton(
              onPressed: widget.onSkip, // This will be changed later to include the operator once selected
              child: const Text('/'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: widget.onShowSolution,
          child: Text('Solution'),
        ),
      ],
    );
  }
}
