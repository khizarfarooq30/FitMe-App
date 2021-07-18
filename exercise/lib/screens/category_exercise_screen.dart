import 'package:flutter/material.dart';

import '../models/exercise_data.dart';
import '../widgets/exercise_item.dart';

class ExerciseCategoryScreen extends StatefulWidget {
  static const routeName = 'category-exercises';
  final List<ExerciseData> exercises;

  ExerciseCategoryScreen(this.exercises);
  @override
  _ExerciseCategoryScreenState createState() => _ExerciseCategoryScreenState();
}

class _ExerciseCategoryScreenState extends State<ExerciseCategoryScreen> {
  String exerciseId;
  String exerciseTitle;
  List<ExerciseData> categoryExercises;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      exerciseId = routeArg['id'];
      exerciseTitle = routeArg['title'];

      categoryExercises = widget.exercises.where((exercise) {
        return exercise.categories.contains(exerciseId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      categoryExercises.removeWhere((exercise) => exercise.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$exerciseTitle '),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final exercise = categoryExercises[index];
          return ExerciseItem(
            id: exercise.id,
            title: exercise.title,
            imageUrl: exercise.imageUrl,
            duration: exercise.duration,
            removeItem: _removeItem,
          );
        },
        itemCount: categoryExercises.length,
      ),
    );
  }
}
