import 'package:flutter/material.dart';
import './exercises_screen.dart';
import './add_exercise_screen.dart';
import '../models/exercise_data.dart';

class TabsScreen extends StatefulWidget {
  final List<ExerciseData> addedExercise;

  TabsScreen(this.addedExercise);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': ExercisesScreen(), 'title': 'FitMe Exercises'},
      {
        'page': AddExerciseScreen(widget.addedExercise),
        'title': 'Added Exercises'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedPage]['title']}'),
      ),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _selectedPage,
          onTap: _selectPage,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              title: Text('Exercises'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_sharp),
              title: Text('Added Exercises'),
            ),
          ]),
    );
  }
}
