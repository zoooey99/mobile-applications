// Comments
// Variables and Data Types
// Control Flow
// Functions and Methods
// Void creates a function which does not return a value
// main() name of the function (reserved for dart)

void main() {
  for (var i = 0; i < 10; i++) {
    print('hello ${i + 1}');
  }
  greeting();
  int result = addTwo(5);
  print(result);
  print(addTwo(4));

  //explicit vs. inferred types
  var inferredString = "William";
  String explicitString = "Jattin";
  print(inferredString + " " + explicitString);

  //null safety
  int? someNumber;
  print(someNumber);

  //control the flow of the program to avoid errors

  //int? goals;
  // if (goals != null) {
  //   print(goals + 2);
  // }

  //concantenation
  String school = "University of Miami";
  print("school is " + school);
  print("school is $school");

  //Build-in types operations
  print("my school name, '$school', has ${school.length} characters");

  //while loops
  int counter = 0;
  while (counter < 2) {
    print(counter);
    counter++;
  }
}

void greeting() {
  print("hello");
}

int addTwo(number) {
  return number + 2;
}

//Variable declaration
//  type identifier/name = value;
//Dynamic Types
//  var identifier/name = value

//Built in data types
//  Numeric
int age = 21;
num count = 3;
double temp = 29.9;
//  Booleans
bool isReady = false;
//  Collections: lists, arrays, maps

//  Strings
String school = "University of Miami";
