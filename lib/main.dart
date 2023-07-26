import 'package:flutter/material.dart';
import 'package:flutter_class/class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'welcome.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Kat(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // int _currentIndex = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    //
  }
  List<String> titles = ["Class", "News", "Home", "Account", "Recruit", "Settings"];
  static List<Widget> _bodywidgetOptions = <Widget>[
    Classbody(),
    Home(),
    Home(),
    Classbody(),
    Classbody(),
    Classbody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Image.asset(
          "assets/logo.PNG",
          width: 55,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _bodywidgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        backgroundColor: Colors.blue[100],
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Class',
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Account',
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore),
            label: 'Recruit',
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue[100],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Our Mission",
            style: TextStyle(
              fontFamily: 'Anton',
              fontSize: 34,
            ),
          ),
          Container(
            height: 300,
            child: Scrollbar(
              child: SingleChildScrollView(
                // scrollDirection: Axis.vertical,
                child: Text(
                  " Our organization's goal is to share high-quality educational resources in the United States for everyone. Most of our speeches and lectures are free! Plus, we provide high quality classes at a reasonable price. Our goal is to help the children fulfill their dreams and grow their dream! We will provide high-quality information on teachers from famous schools in the United States. Parents in need can choose the courses they need for their children, including English reading, English writing, grammar, art, math, computer science, middle school and college guidance planning, counseling and other aspects of college entrance examination. Additionally, we will organize some meaningful offline activities, as well as public welfare activities for students to help each other, to jointly create an educational community environment of mutual help. Our students come from all over the world, we share educational resources and develop together!",
                  style: TextStyle(fontFamily: 'Merriweather'),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                )
            ),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Image.asset(
              'assets/globalmap.JPG',
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}