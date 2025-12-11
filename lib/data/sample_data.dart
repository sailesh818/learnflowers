
// -----------------------------
// Sample Data
// -----------------------------
import 'package:flutter/material.dart';
import 'package:learn_flowers/model/flower_model.dart';

final sampleFlowers = [
  Flower(
    id: 'f1',
    name: 'Rose',
    scientificName: 'Rosa',
    color: 'Red',
    region: 'Worldwide',
    bloomTime: 'Spring',
    description: 'A symbol of love and beauty.',
    uses: ['Ornamental', 'Perfume', 'Medicinal'],
    care: {'water': 'Moderate', 'sunlight': 'Full', 'soil': 'Loamy', 'temperature': '15-25°C'},
    facts: ['Over 100 species', 'National flower of USA'],
  ),
  Flower(
    id: 'f2',
    name: 'Tulip',
    scientificName: 'Tulipa',
    color: 'Various',
    region: 'Europe & Asia',
    bloomTime: 'Spring',
    description: 'A beautiful cup-shaped flower.',
    uses: ['Ornamental', 'Floristry'],
    care: {'water': 'Moderate', 'sunlight': 'Full', 'soil': 'Sandy', 'temperature': '10-20°C'},
    facts: ['Symbol of Netherlands', 'Many colors exist'],
  ),
  Flower(
    id: 'f3',
    name: 'Sunflower',
    scientificName: 'Helianthus',
    color: 'Yellow',
    region: 'North America',
    bloomTime: 'Summer',
    description: 'Follows the sun movement.',
    uses: ['Oil', 'Ornamental', 'Food'],
    care: {'water': 'Moderate', 'sunlight': 'Full', 'soil': 'Fertile', 'temperature': '20-30°C'},
    facts: ['Grows very tall', 'Seeds edible'],
  ),
  Flower(
    id: 'f4',
    name: 'Lily',
    scientificName: 'Lilium',
    color: 'White',
    region: 'Asia',
    bloomTime: 'Summer',
    description: 'Fragrant flower often used in bouquets.',
    uses: ['Ornamental', 'Perfume'],
    care: {'water': 'Moderate', 'sunlight': 'Partial', 'soil': 'Loamy', 'temperature': '18-25°C'},
    facts: ['Symbolizes purity', 'Many varieties exist'],
  ),
  Flower(
    id: 'f5',
    name: 'Orchid',
    scientificName: 'Orchidaceae',
    color: 'Varied',
    region: 'Tropical Asia',
    bloomTime: 'Varied',
    description: 'Exotic flowers with intricate patterns.',
    uses: ['Ornamental', 'Perfume'],
    care: {'water': 'Low', 'sunlight': 'Partial', 'soil': 'Special mix', 'temperature': '20-28°C'},
    facts: ['Over 25,000 species', 'Popular in bonsai and decoration'],
  ),
  Flower(
    id: 'f6',
    name: 'Daffodil',
    scientificName: 'Narcissus',
    color: 'Yellow',
    region: 'Europe',
    bloomTime: 'Spring',
    description: 'Trumpet-shaped flowers, cheerful in appearance.',
    uses: ['Ornamental', 'Floristry'],
    care: {'water': 'Moderate', 'sunlight': 'Full', 'soil': 'Well-drained', 'temperature': '10-20°C'},
    facts: ['Symbol of hope', 'National flower of Wales'],
  ),
];

// -----------------------------
// Quiz Builders
// -----------------------------
List<QuizQuestion> buildSimpleQuiz(BuildContext ctx, int count) {
  final flowers = sampleFlowers;
  final questions = flowers.take(count).map((f) {
    return QuizQuestion(
      id: f.id,
      question: 'Which flower is described: ${f.description}',
      options: flowers.map((fl) => fl.name).toList()..shuffle(),
      correctAnswer: f.name,
    );
  }).toList();
  return questions;
}

List<QuizQuestion> buildColorQuiz(BuildContext ctx, int count) {
  final flowers = sampleFlowers;
  final questions = flowers.take(count).map((f) {
    return QuizQuestion(
      id: f.id,
      question: 'What is the main color of ${f.name}?',
      options: flowers.map((fl) => fl.color).toList()..shuffle(),
      correctAnswer: f.color,
    );
  }).toList();
  return questions;
}
