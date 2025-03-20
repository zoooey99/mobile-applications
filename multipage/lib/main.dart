import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';

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

  //class collections data
  var titles = [
    "About",
    "History",
    "Housing",
    "Student Life",
    "Food",
    "Academics"
  ];

  var img = [
    "https://welcome.miami.edu/_assets/images/about-um/Financing_UMCampus_138-1240x550.jpg",
    "https://welcome.miami.edu/_assets/images/about-um/AnastasiaBldgNoGirl_Vintage_tinted_1240x550.jpg",
    "https://newstudenthousing.studentaffairs.miami.edu/_assets/images/renderings/lake-dusk-1240x550.png",
    "https://i0.wp.com/distractionmagazine.com/wp-content/uploads/2024/11/DSC06781.jpg?resize=800%2C1199&ssl=1",
    "https://welcome.miami.edu/_assets/images/student-life/StudentFans_Football_480x320.jpg",
    "https://www.coe.miami.edu/_assets/images/homepage/grids/umgrads051211-043_1200x800.jpg"
  ];

  var summaries = [
    "Established in 1925, the University of Miami comprises 12 schools and colleges offering nearly 350 majors and programs to a diverse student body.",
    "Chartered in 1925, UM was founded to support education, research, and culture in South Florida, emphasizing inter-American studies and tropical research.",
    "UM offers modern on-campus housing, including Lakeside Village and Hecht Residential College, with various living-learning communities for first-year and upperclass students.",
    "Student life at UM is vibrant, featuring over 300 student organizations, Greek life, concerts, and events like Canes After Dark and Homecoming festivities.",
    "UM’s campus dining includes a variety of options like dining halls, food courts, and local favorites, catering to diverse tastes and dietary needs.",
    "Ranked among top universities, UM provides strong academics, small class sizes, research opportunities, and faculty mentorship across its diverse programs."
  ];
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
        ListView(children: <Widget>[
          for (int i = 0; i < 6; i++)
            Customcard(img[i], titles[i], summaries[i]),
        ]),
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
