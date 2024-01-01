
import 'package:flutter/material.dart';
import 'dart:math';

class CountdownWidget extends StatefulWidget {
  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int requiredNumber = 0; // Example required number
  List<int> presetNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 25, 50, 75, 100]; // Example random numbers
  List<int> setNumbers = []; 
  int currentTotal = 0; 
  int prevTotal = 0; 
  List<String> calculatons = [];  // List that contains the entire list of calculations made. Used in the Solution pop-up window

  @override
  void initState() {
    super.initState(); 
    getRandomNumbers(); 
    calculateRequiredNumber(); 
  }


  void getRandomNumbers() {
    List<int> randomNumbers = []; // Example random numbers
    Random random = Random(); 

    for (int i = 0; i < 6; i++) {
      int randomNumber = presetNumbers[random.nextInt(presetNumbers.length)]; 
      randomNumbers.add(randomNumber);
    }
    setNumbers = randomNumbers;  
  }


  void calculateRequiredNumber() {
    bool status; 
    currentTotal = 0; 
    prevTotal = 0; 

    List<int> setNumbersCopy = List.from(setNumbers); 
    do {
      Random random = Random();
      int index = random.nextInt(setNumbersCopy.length); 
      int firstNum = setNumbersCopy.elementAt(index);

      setNumbersCopy.removeAt(index); 

      if (setNumbersCopy.length < 5) {
        do {
          status = updateRequiredNumber(firstNum);
        } while (!status);
        prevTotal = currentTotal; 
      }
      else { 
        prevTotal = firstNum; 
      }
    } while(setNumbersCopy.isNotEmpty); 
    requiredNumber = currentTotal;
  }


  bool updateRequiredNumber(int num1) {
    Random random = Random(); 
    List<String> operatorsList = ['+', '-', '*', '/'];
    String operator = operatorsList.elementAt(random.nextInt(operatorsList.length));

    switch (operator) {
      case '+':
        currentTotal = prevTotal + num1; 
        calculatons.add("$prevTotal + $num1 = $currentTotal"); 
        return true; 

      case '-':
        if (prevTotal > num1) {
          currentTotal = prevTotal - num1; 
          calculatons.add("$prevTotal - $num1 = $currentTotal"); 
          return true; 
        }
        else if (prevTotal < num1) {
          currentTotal = num1 - prevTotal; 
          calculatons.add("$num1 - $prevTotal = $currentTotal"); 
          return true; 
        }
        else {
          return false; 
        }
        
      case '*':
        currentTotal = prevTotal * num1; 
        calculatons.add("$prevTotal * $num1 = $currentTotal"); 
        return true; 

      case '/':
        if (prevTotal > num1 && prevTotal % num1 == 0) {
          currentTotal = prevTotal / num1 as int; 
          calculatons.add("$prevTotal + $num1 = $currentTotal"); 
          return true; 
        }
        else if (prevTotal < num1 && num1 % prevTotal == 0) {
          currentTotal = num1 / prevTotal as int; 
          calculatons.add("$prevTotal + $num1 = $currentTotal"); 
          return true; 
        }
        else {
          return false; 
        }

      default: 
        return false; 
    }
  }


  void _restartNumbers() {
    setState(() {
      getRandomNumbers();
    });
  }


  void _skipToNextSet() {
    setState(() {
      getRandomNumbers();
      calculateRequiredNumber(); 
    });
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
