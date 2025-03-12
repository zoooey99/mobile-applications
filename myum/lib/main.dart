import 'package:flutter/material.dart';

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyUMApp());
  }
}

class MyUMApp extends StatefulWidget {
  const MyUMApp({super.key});

  @override
  State<MyUMApp> createState() => _MyUMAppState();
}

class _MyUMAppState extends State<MyUMApp> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: <Widget>[
        Text("Dashboard",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline)),
        Text(
          "Page $currentPage",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.purple,
            letterSpacing: 1.5,
          ),
        ),
        Text(
          "Page $currentPage",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.green,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text("Page $currentPage",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black38,
                  offset: Offset(2, 2),
                ),
              ],
            ))
      ][currentPage]),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          NavigationDestination(icon: Icon(Icons.pages), label: "Page 1"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Page 2"),
          NavigationDestination(
              icon: Icon(Icons.sports_soccer), label: "Page 3"),
        ],
        selectedIndex: currentPage,
        indicatorColor: Colors.amber,
      ),
    );
  }
}
