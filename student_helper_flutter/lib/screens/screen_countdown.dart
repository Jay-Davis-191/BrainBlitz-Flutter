import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_helper_flutter/widgets/countdown_widget.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {

int requiredNumber = 0; // Example required number
  List<int> presetNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 25, 50, 75, 100]; // Example random numbers
  List<int> setNumbers = []; 
  int currentTotal = 0; 
  int prevTotal = 0; 
  List<String> calculations = [];  // List that contains the entire list of calculations made. Used in the Solution pop-up window

  @override
  void initState() {
    super.initState(); 
    getRandomNumbers(); 
    calculateRequiredNumber(); 
  }
  
  
  void getRandomNumbers() {
    setState(() {
      List<int> randomNumbers = []; // Example random numbers
      Random random = Random(); 

      for (int i = 0; i < 6; i++) {
        int randomNumber = presetNumbers[random.nextInt(presetNumbers.length)]; 
        randomNumbers.add(randomNumber);
      }
      setNumbers = randomNumbers;    
    });
    
  }


  void calculateRequiredNumber() {
    setState(() {
      bool status; 
      currentTotal = 0; 
      prevTotal = 0; 
      calculations = []; 
  
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
      });

  }


  bool updateRequiredNumber(int num1) {
    Random random = Random(); 
    List<String> operatorsList = ['+', '-', '*', '/'];
    String operator = operatorsList.elementAt(random.nextInt(operatorsList.length));

    switch (operator) {
      case '+':
        currentTotal = prevTotal + num1; 
        calculations.add("$prevTotal + $num1 = $currentTotal"); 
        return true; 

      case '-':
        if (prevTotal > num1) {
          currentTotal = prevTotal - num1; 
          calculations.add("$prevTotal - $num1 = $currentTotal"); 
          return true; 
        }
        else if (prevTotal < num1) {
          currentTotal = num1 - prevTotal; 
          calculations.add("$num1 - $prevTotal = $currentTotal"); 
          return true; 
        }
        else {
          return false; 
        }
        
      case '*':
        currentTotal = prevTotal * num1; 
        calculations.add("$prevTotal * $num1 = $currentTotal"); 
        return true; 

      case '/':
        if (prevTotal > num1 && prevTotal % num1 == 0) {
          currentTotal = prevTotal / num1 as int; 
          calculations.add("$prevTotal + $num1 = $currentTotal"); 
          return true; 
        }
        else if (prevTotal < num1 && num1 % prevTotal == 0) {
          currentTotal = num1 / prevTotal as int; 
          calculations.add("$prevTotal + $num1 = $currentTotal"); 
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
      getRandomNumbers();
  }


  void _skipToNextSet() {
      getRandomNumbers();
      calculateRequiredNumber(); 
    // Logic to skip to the next set of numbers
  }


  void example() {

  }

  void _showSolution() {
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Solution'),
          content: SingleChildScrollView(
            child: ListBody(
              children: calculations.map((item) {
                return Text(item); // Each item on a new line
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Math Game'),
      ),
      body: Center(
        child: CountdownWidget(
          requiredNumber: requiredNumber,
          setNumbers: setNumbers, 
          onShowSolution: _showSolution,
          onRestartNumbers: _restartNumbers, 
          onSkip: _skipToNextSet, 
        )
        
      ),
    );
  }
}

