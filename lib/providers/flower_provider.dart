import 'package:flutter/material.dart';
import 'package:learn_flowers/data/sample_data.dart';
import 'package:learn_flowers/model/flower_model.dart';

class FlowerProvider extends ChangeNotifier {
  final List<Flower> _flowers = sampleFlowers;

  List<Flower> get flowers => List.unmodifiable(_flowers);

  Flower? findById(String id) {
    try {
      return _flowers.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }

  List<Flower> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return flowers;
    return _flowers.where((f) {
      return f.name.toLowerCase().contains(q) ||
          f.scientificName.toLowerCase().contains(q) ||
          f.color.toLowerCase().contains(q) ||
          f.region.toLowerCase().contains(q);
    }).toList();
  }
}