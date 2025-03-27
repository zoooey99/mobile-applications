import 'package:flutter/material.dart';
import 'package:multipage/display.dart';
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

  var titles2 = [
    "Celebrating a century of achievement with music",
    "The musician she was meant to be",
    "Bringing his music back home",
    "A collision of musical worlds",
    "From childhood talent to industry success",
    "The soul of American song"
  ];

  var img2 = [
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/centennialartists365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/raquelsofia365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/musichome365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/tf3365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/idarose365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/02/soulsong365x365.png"
  ];

  var summaries2 = [
    "A landmark concert by generations of famous Frost School alumni, hosted by celebrity TV host and Cane grad Jason Kennedy, will be the centerpiece of the University of Miami and the Frost School of Music’s Centennial Celebration on April 8.",
    "Raquel Sofia’s path to international success as a bi-cultural singer and songwriter led through the Frost School of Music.",
    "Multi-talented musician Justin Kinchen took the extraordinary skills he’s developed at the Frost School to a concert in his hometown of Indianapolis that showcased his original jazz and classical compositions and paid tribute to his childhood mentors.",
    "The Frost School’s elite Stamps Ensembles learned to take new musical risks in a residency with the famed Time For Three trio, which blends multiple popular genres for a bold new interpretation of classical music.",
    "The Frost School of Music helped songwriter and producer Alexis \"Idarose\" Kesselman turn her musical instincts into remarkable industry achievement.",
    "A songwriting class that draws inspiration from the rich panoply of Black music helps students at the Frost School of Music expand their artistry, empathy, and understanding of American music."
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
        ListView(children: <Widget>[
          for (int i = 0; i < 6; i++)
            Customcard(img2[i], titles2[i], summaries2[i]),
        ]),
        NewCard()
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
