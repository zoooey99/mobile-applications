import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

//placeholder for home
class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}

//The Actual App
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  //class variables
  int groupValue = 0;
  double T = 0;
  double R = 0;
  String converted = "";

  double _currentSliderValue = 0.0;
  Color _currentSliderColor = Colors.black;

//class methods/functions
  performConversion(int value) {
    if (value == 1) {
      R = (T - 32.0) * (5 / 9);
      converted = "$R C";
    } else if (value == 2) {
      R = (T * 1.8) + 32;
      converted = "$R F";
    }
  }

  determineColor(double value) {
    print(groupValue);
    Color newColor = Colors.pink;
    if (groupValue == 1) {
      if (value < 0) {
        newColor = Colors.deepPurple;
      } else if (value < 11) {
        newColor = Colors.blue;
      } else if (value < 22) {
        newColor = Colors.green;
      } else if (value < 27) {
        newColor = Colors.yellow;
      } else {
        newColor = Colors.red;
      }
    } else if (groupValue == 2) {
      if (value < 32) {
        newColor = Colors.deepPurple;
      } else if (value < 52) {
        newColor = Colors.blue;
      } else if (value < 72) {
        newColor = Colors.green;
      } else if (value < 82) {
        newColor = Colors.yellow;
      } else {
        newColor = Colors.red;
      }
    } else {
      return Colors.brown;
    }
    return newColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Temperature Converter"),
          backgroundColor: Colors.blueGrey),
      body: Padding(
          padding: EdgeInsets.all(36.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(labelText: 'Enter Temperature'),
                onChanged: (String value) {
                  T = double.parse(value);
                },
              ),
              SizedBox(height: 10.0),
              Row(children: [
                Radio(
                  activeColor: Colors.purple,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) {
                    groupValue = 1;
                    performConversion(e!);

                    setState(() {
                      //TODO: Set state

                      groupValue = 1;
                      _currentSliderColor = determineColor(R);
                      _currentSliderValue = R;
                    });
                  },
                ),
                Text("F to C"),
                SizedBox(height: 5.0),
                Radio(
                  activeColor: Colors.orange,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (e) {
                    performConversion(e!);

                    setState(() {
                      //TODO
                      groupValue = 2;
                      _currentSliderColor = determineColor(R);
                      _currentSliderValue = R;
                    });
                  },
                ),
                Text("C to F")
              ]),
              SizedBox(height: 10.0),
              TextButton(
                child: Text('Clear'),
                onPressed: () {
                  setState(() {
                    //TODO
                    groupValue = 0;
                    converted = "";
                    _currentSliderValue = 0.0;
                    _currentSliderColor = Colors.black;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(converted),
              SizedBox(height: 20.0),
              Slider(
                value: _currentSliderValue,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderColor = determineColor(value);
                    _currentSliderValue = value;
                  });
                },
                label: _currentSliderValue.toString(),
                activeColor: _currentSliderColor,
                min: 0,
                max: 100.0,
              ),
            ],
          )),
    );
  }
}
