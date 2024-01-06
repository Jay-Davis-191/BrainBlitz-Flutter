import 'package:flutter/material.dart';
import 'package:student_helper_flutter/models/database.dart';
import 'package:student_helper_flutter/models/user.dart';

class FlashcardWidget extends StatefulWidget {
  final String reminderText;
  final String answerText;
  final Function onNext;
  final Function onPrevious;
  final VoidCallback onAddFlashcards; 
  final VoidCallback onDeleteFlashcards; 

  FlashcardWidget({
    required this.reminderText,
    required this.answerText,
    required this.onNext,
    required this.onPrevious,
    required this.onAddFlashcards, 
    required this.onDeleteFlashcards
  });

  @override
  _FlashcardWidgetState createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.reminderText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 8.0), // Spacer
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showAnswer = !showAnswer;
                    });
                  },
                  child: Text(showAnswer ? widget.answerText : 'Show Answer'),
                ),
                SizedBox(height: 16.0), // Spacer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: widget.onPrevious as void Function()?,
                      child: Text('Previous'),
                    ),
                    ElevatedButton(
                      // onPressed: widget.onNext as void Function()?,
                      onPressed: () async {
                        var data = await Database.fetchData(); 
                        print(data); 
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0), // Spacer
                ElevatedButton(
                  onPressed: widget.onAddFlashcards,
                  child: Text("Add Flashcard"),
                ),
                SizedBox(height: 16.0), // Spacer
                ElevatedButton(
                  onPressed: widget.onDeleteFlashcards,
                  child: Text("Delete Flashcard"),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
