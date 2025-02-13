import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollMain());
}

// MaterialApp widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// end MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dice Roll"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
            child: TextButton(
                onPressed: () => setState(() {
                      diceNumber = Random().nextInt(6) + 1;
                    }),
                child: Image.asset("images/dice-$diceNumber.png")
                //Text("You rolled a: $diceNumber")
                )));
  }
}
