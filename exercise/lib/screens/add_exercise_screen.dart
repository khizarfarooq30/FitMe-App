import 'package:flutter/material.dart';
import '../models/exercise_data.dart';
import '../widgets/exercise_item.dart';

class AddExerciseScreen extends StatelessWidget {
  static const routeName = 'favorites';

  List<ExerciseData> exercises = [];

  AddExerciseScreen(this.exercises);

  @override
  Widget build(BuildContext context) {
    if (exercises.isEmpty) {
      return Center(
        child: Text('You have no Exercises added yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return ExerciseItem(
            id: exercise.id,
            title: exercise.title,
            imageUrl: exercise.imageUrl,
            duration: exercise.duration,
            removeItem: () {},
          );
        },
        itemCount: exercises.length,
      );
    }
  }
}
