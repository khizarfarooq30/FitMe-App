import 'package:flutter/material.dart';
import './dummy-data.dart';
import './models/exercise_data.dart';
  import './screens/exercises_screen.dart';
import './screens/category_exercise_screen.dart';
import './screens/exercise_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ExerciseData> _allExercises = DUMMY_EXERCISES;
  List<ExerciseData> _addedExercises = [];

  void _toggleFavorite(String exerciseId) {
    final existingIndex =
        _addedExercises.indexWhere((exercise) => exercise.id == exerciseId);
    if (existingIndex >= 0) {
      setState(() {
        _addedExercises.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _addedExercises.add(DUMMY_EXERCISES.firstWhere((exercise) => exercise.id == exerciseId));
      });
    }
  }

  bool _isExerciseAdded(String exerciseId) {
    return _addedExercises.any((exercise) => exercise.id == exerciseId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitMe App',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.black,
          fontFamily: 'Raleway',
          buttonColor: Colors.blueAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        '/': (context) => TabsScreen(_addedExercises),
        ExerciseCategoryScreen.routeName: (context) =>
            ExerciseCategoryScreen(_allExercises),
        ExerciseDetailScreen.routeName: (context) =>
            ExerciseDetailScreen(_toggleFavorite, _isExerciseAdded),
      },
      // dynamic route setting
      // onGenerateRoute: (settings){
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },
      // 404 fallback
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => ExercisesScreen());
      },
    );
  }
}
