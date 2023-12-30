import 'package:flutter/material.dart';
import 'package:student_helper_flutter/models/user.dart';
import 'package:student_helper_flutter/navigation/nav_base_widget.dart';
import 'package:student_helper_flutter/widgets/flashcard_widget.dart';

class FlashcardScreen extends StatefulWidget {
  final User? user; 
  const FlashcardScreen({super.key, required this.user});

  @override
  _FlashcardScreenState createState() => _FlashcardScreenState(); 
}


class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Map<String, String>> flashcards = [
    {'reminder': 'Name', 'answer': 'Jay'},
    {'reminder': 'Age', 'answer': '21'},
    // ... more flashcards ...
  ];

  String showButtonText = 'Show Answer';
  int currentIndex = 0;

  void _goToNextFlashcard() {
    if (currentIndex == (flashcards.length - 1)) {
      setState(() {
        currentIndex = 0; 
        showButtonText = 'Show Answer';
      });
    }

    else if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
        showButtonText = 'Show Answer';
      });
    }
  }

  void _goToPreviousFlashcard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        showButtonText = 'Show Answer';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlashcardWidget(
      reminderText: flashcards[currentIndex]['reminder']!,
      answerText: flashcards[currentIndex]['answer']!,
      onNext: _goToNextFlashcard,
      onPrevious: _goToPreviousFlashcard,
    );
  }
}