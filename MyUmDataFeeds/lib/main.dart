import 'package:flutter/material.dart';
import 'package:multipage/display.dart';
import 'dashboard.dart';
import 'customcard.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

//make network request
Future<String> fetchXML(String url) async {
  final output = await http.get(Uri.parse(url));
  return output.body;
}

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
  List<Widget> myNews = [];
  List<Widget> myNews2 = [];
  List<Widget> myNews3 = [];
  //initstate is for anything you need before the app renders
  @override
  void initState() {
    super.initState();
    fetchXML('https://news.miami.edu/feeds/latest-25.xml').then((data) {
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');
      newsitems.forEach((newsitem) {
        //now we have access to newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);

        var newsTitle = newsitem.getElement('title')?.innerText;
        print(newsTitle);

        var abstractText = newsitem.getElement('abstract')?.innerText;
        print(abstractText);
        //to add items to a list or collection, we use the .add method
        myNews.add(Customcard(img!, newsTitle!, abstractText!));
      });
    }).catchError((error) {
      print('error getting data: $error');
    });
    fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml')
        .then((data) {
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');
      newsitems.forEach((newsitem) {
        //now we have access to newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);

        var newsTitle = newsitem.getElement('title')?.innerText;
        print(newsTitle);

        var abstractText = newsitem.getElement('abstract')?.innerText;
        print(abstractText);
        //to add items to a list or collection, we use the .add method
        myNews2.add(Customcard(img!, newsTitle!, abstractText!));
      });
    }).catchError((error) {
      print('error getting data: $error');
    });
    fetchXML('https://news.miami.edu/frost/feeds/all-news-15.xml').then((data) {
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');
      newsitems.forEach((newsitem) {
        //now we have access to newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);

        var newsTitle = newsitem.getElement('title')?.innerText;
        print(newsTitle);

        var abstractText = newsitem.getElement('abstract')?.innerText;
        print(abstractText);
        //to add items to a list or collection, we use the .add method
        myNews3.add(Customcard(img!, newsTitle!, abstractText!));
      });
    }).catchError((error) {
      print('error getting data: $error');
    });
  }

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
        Dashboard(),
        ListView(children: myNews),
        ListView(children: myNews2),
        ListView(children: myNews3)
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
          NavigationDestination(icon: Icon(Icons.home), label: "About UM"),
          NavigationDestination(icon: Icon(Icons.music_note), label: "Frost"),
          NavigationDestination(
              icon: Icon(Icons.bus_alert), label: "Transport"),
        ],
        selectedIndex: currentPage,
        indicatorColor: Colors.amber,
      ),
    );
  }
}
