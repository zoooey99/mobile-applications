import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(16),
          child: Image.network(
              "https://admissions.law.miami.edu/_assets/images/images/480x320/480x320_0000_mike-montero-campus-beauty-shots_22.jpg",
              width: 400)),
      Padding(
          padding: EdgeInsets.all(10),
          child: Text("University of Miami",
              style: TextStyle(color: Colors.deepOrange))),
      Padding(
          padding: EdgeInsets.all(20),
          child: Text(
              "The University of Miami is one of America's top research universities located in one of the most dynamic and multicultural cities in the world."))
    ]);
  }
}
