import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //class variables
  int groupValue = 2;
  int currentQuestion = 0;
  int score = 0;
  String result = "";
  Color backgroundColor = Colors.grey;

  var questions = [
    'The keto diet is high in carbohydrates and low in fat.',
    'The ketogenic diet primarily uses fats for energy instead of carbohydrates.',
    'Ketosis is a metabolic state where the body burns glucose for energy.',
    'Eating too much protein can potentially kick you out of ketosis.',
    'The keto diet allows unlimited consumption of fruits and vegetables.',
    'A common side effect of starting keto is the "keto flu."',
    'The ketogenic diet was originally developed to help treat epilepsy.',
    'Dairy products are not allowed on the keto diet.',
    'Keto diets are generally high in processed foods and sugar.',
    'The keto diet can help some people with weight loss and blood sugar control.'
  ];

  var answers = [0, 1, 0, 1, 0, 1, 1, 0, 0, 1];

  //class methods
  void checkAnswer(int answer) {
    print('User answered $answer');

    if (answers[currentQuestion] == answer) {
      print("Correct");
      score++;
      result = "Correct";
      backgroundColor = Colors.greenAccent;
    } else {
      print("Incorrect");
      result = "Incorrect";
      backgroundColor = Colors.redAccent;
    }

    //if answer is true or false, set the score and show the result correct/incorrect
    setState(() {
      groupValue = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text("Quiz App"),
        ),
        body: Padding(
            padding: EdgeInsets.all(36.6),
            child: Column(
              children: <Widget>[
                Text(questions[currentQuestion]),
                Row(
                  children: <Widget>[
                    Radio(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (e) => {checkAnswer(e!)}),
                    Text("True"),
                    Radio(
                        value: 0,
                        groupValue: groupValue,
                        onChanged: (e) => {checkAnswer(e!)}),
                    Text("False"),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          setState(() {
                            currentQuestion++;
                            groupValue = 2;
                            result = "";
                            if (currentQuestion > questions.length - 1) {
                              currentQuestion -= 1;
                            }
                          })
                        },
                    child: Text("Next")),
                Text(result,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white, // Text color
                      backgroundColor: backgroundColor, // Background color
                    )),
                Text("Score: $score"),
              ],
            )));
  }
}
