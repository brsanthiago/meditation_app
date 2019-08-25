import 'package:flutter/material.dart';
import 'package:meditation_app/ui/home_page.dart';

void main() => runApp(MaterialApp(
      title: "Meditation",
      theme: ThemeData(primaryColor: Colors.redAccent, primarySwatch: Colors.blue),
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text("Today"), icon: Icon(Icons.calendar_today)),
          BottomNavigationBarItem(
              icon: Icon(Icons.blur_on), title: Text("All Exercicies")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Setings"))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
