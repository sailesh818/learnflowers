class Flower {
  final String id;
  final String name;
  final String scientificName;
  final String color;
  final String region;
  final String bloomTime;
  final String description;
  final List<String> uses;
  final Map<String, String> care;
  final List<String> facts;

  Flower({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.color,
    required this.region,
    required this.bloomTime,
    required this.description,
    required this.uses,
    required this.care,
    required this.facts,
  });
}

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}