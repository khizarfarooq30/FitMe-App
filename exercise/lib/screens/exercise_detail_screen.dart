import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../models/exercise_data.dart';
import '../dummy-data.dart';

class ExerciseDetailScreen extends StatelessWidget {
  static const routeName = 'exercise-details';
  final Function toggleAddExercise;
  final Function isExerciseAdded;
  ExerciseDetailScreen(this.toggleAddExercise, this.isExerciseAdded);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final id = routeArg['id'];

    final ExerciseData exercise = DUMMY_EXERCISES.firstWhere((exercise) => exercise.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${exercise.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                exercise.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 800,
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(exercise.steps[index]),
                ),
                itemCount: exercise.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        marginRight: 20,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 8,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: isExerciseAdded(id)
                  ? Icon(Icons.delete)
                  : Icon(Icons.add),
              backgroundColor: Theme.of(context).accentColor,
              label: isExerciseAdded(id) ? 'Remove from the list' : 'Add to Exercise List',
              labelStyle: TextStyle(fontSize: 18),
              onTap: () {
                toggleAddExercise(id);
              }),
        ],
      ),
    );
  }
}
