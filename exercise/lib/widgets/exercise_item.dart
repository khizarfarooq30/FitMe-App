import 'package:flutter/material.dart';
import '../screens/exercise_detail_screen.dart';

import '../models/exercise_data.dart';

class ExerciseItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Function removeItem;

  ExerciseItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.removeItem,
  });

  void selectExercise(BuildContext context) {
    Navigator.of(context).pushNamed(
      ExerciseDetailScreen.routeName,
      arguments: {'id': id},
    ).then((id) {
      if (id != null) {
        removeItem(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectExercise(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: Container(
                      width: 280,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        '$title',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
