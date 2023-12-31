import 'package:flutter/material.dart';
import 'dart:math';

class CountdownWidget extends StatefulWidget {
  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int requiredNumber = 0; // Example required number
  List<int> setNumbers = []; 
  String solutionWorking = ''; 


  @override
  void initState() {
    super.initState(); 
    getRandomNumbers(); 
  }

  void getRandomNumbers() {
    List<int> presetNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 25, 50, 75, 100]; // Example random numbers
    List<int> randomNumbers = []; // Example random numbers
    Random random = Random(); 

    for (int i = 0; i < 6; i++) {
      int randomNumber = presetNumbers[random.nextInt(presetNumbers.length)]; 
      randomNumbers.add(randomNumber);
    }
    setNumbers = randomNumbers;  
  }

  void _restartNumbers() {
    // Logic to restart the numbers
  }

  void _skipToNextSet() {
    // Logic to skip to the next set of numbers
  }

  void _showSolution() {
    // Logic to display the solution in a popup
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _restartNumbers,
              child: Text('Restart'),
            ),
            ElevatedButton(
              onPressed: _skipToNextSet,
              child: Text('Pass'),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Required Number: $requiredNumber',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          ElevatedButton(
            onPressed: _skipToNextSet,
            child: Text(setNumbers.elementAt(0).toString()),
            ),
          ElevatedButton(
            onPressed: _skipToNextSet,
            child: Text(setNumbers.elementAt(1).toString()),
            ),
          ElevatedButton(
            onPressed: _skipToNextSet,
            child: Text(setNumbers.elementAt(2).toString()),
            ),
          ElevatedButton(
            onPressed: _skipToNextSet,
            child: Text(setNumbers.elementAt(3).toString()),
            ),
          ElevatedButton(
            onPressed: _skipToNextSet,
            child: Text(setNumbers.elementAt(4).toString()),
            ),
          ElevatedButton(
            onPressed: _skipToNextSet,
            child: Text(setNumbers.elementAt(5).toString()),
            ),  
          ]
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _showSolution,
              child: Text('+'),
            ),
            ElevatedButton(
              onPressed: _showSolution,
              child: Text('-'),
            ),
            ElevatedButton(
              onPressed: _showSolution,
              child: Text('x'),
            ),
            ElevatedButton(
              onPressed: _showSolution,
              child: Text('/'),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _showSolution,
          child: Text('Solution'),
        ),
      ],
    );
  }
}
