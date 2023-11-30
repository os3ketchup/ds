import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final List<Map<String, dynamic>> categoryQuestions;

  final int totalQuestions; // Total number of questions

  final String categoryName; // Name of the category

  SecondScreen({required this.categoryName,
    required this.totalQuestions,
    required this.categoryQuestions});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool answerClicked = false;
  int selectedAnswerIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Filter questions for the selected category
    List<Map<String, dynamic>> filteredList = widget.categoryQuestions
        .where((question) => question["categoryName"] == widget.categoryName)
        .toList();
    return Scaffold(
      backgroundColor: Color(0xffee006d77),
      appBar: AppBar(
        backgroundColor: Color(0xFFEE83c5be),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFEEedf6f9),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                _nextQuestion(filteredList);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              )),
          SizedBox(width: 16.0),
        ],
        flexibleSpace: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              widget.categoryName,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${currentQuestionIndex + 1}/ ${filteredList.length}',
              //should fix ${widget.totalQuestions}
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Color(0xFFEEe29578)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xffeeffddd2), // Change color here
                borderRadius: BorderRadius.circular(16), // Adjust borderRadius

              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  filteredList[currentQuestionIndex]['question'],
                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 20.0, color: Color(0xffee006d77)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList[currentQuestionIndex]['answers'].length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = answerClicked && index == selectedAnswerIndex;
                bool isCorrect = index ==
                    filteredList[currentQuestionIndex]['correctAnswer'] - 1;

                return Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  // Set the margin here
                  child: GestureDetector(
                    onTap: () {
                      if (!answerClicked) {
                        setState(() {
                          answerClicked = true;
                          selectedAnswerIndex = index;
                          if (isCorrect) {
                            correctAnswers++;
                          }
                          // Handle UI changes for selected answer
                        });
                        Future.delayed(Duration(milliseconds: 300), () {
                          _nextQuestion(filteredList);
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffeeffddd2)),
                        borderRadius: BorderRadius.circular(20.0),
                        color: isSelected
                            ? (isCorrect ? Colors.green : Colors.red)
                            : Color(0xFFEEe29578),
                      ),
                      child: Text(
                        filteredList[currentQuestionIndex]['answers'][index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, color: Color(
                            0xffedf6f9)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _nextQuestion(List<Map<String, dynamic>> quizData) {
    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answerClicked = false;
        selectedAnswerIndex = -1;
      });
    } else {
      // Show dialog with quiz summary
      _showQuizSummaryDialog(quizData);
    }
  }

  void _showQuizSummaryDialog(List<Map<String, dynamic>> quizData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(data: ThemeData(
          // Define the AlertDialogTheme to change the appearance
          dialogTheme: DialogTheme(
            backgroundColor: Color(0xffee006d77), // Change the background color of the dialog

          ),
        ), child: AlertDialog(

          title: Text('Quiz Summary',style: TextStyle(color: Color(0xffeeedf6f9))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Questions: ${quizData.length}',style: TextStyle(color: Color(0xffeeedf6f9)),),
              Text('Correct Answers: $correctAnswers',style: TextStyle(color: Color(0xffeeedf6f9)),),
              Text('Wrong Answers: ${quizData.length - correctAnswers}',style: TextStyle(color: Color(0xffeeedf6f9)),),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Quit',style: TextStyle(color: Color(0xffeeedf6f9)),),
            ),
            TextButton(
              onPressed: () {
                // Reset quiz and start again
                setState(() {
                  currentQuestionIndex = 0;
                  correctAnswers = 0;
                  answerClicked = false;
                });
                Navigator.pop(context); // Close dialog
              },
              child: Text('Restart',style: TextStyle(color: Color(0xffeeedf6f9)),),
            ),
          ],

        ));
      },
    );
  }
}
