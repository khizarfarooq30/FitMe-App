import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class ExerciseData {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> steps;
  final int duration;


  const ExerciseData({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.steps,
    @required this.duration,

  });
}
