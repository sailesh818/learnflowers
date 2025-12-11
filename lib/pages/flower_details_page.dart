
// -----------------------------
// Flower Details Page
// -----------------------------
import 'package:flutter/material.dart';
import 'package:learn_flowers/providers/favorites_provider.dart';
import 'package:learn_flowers/providers/flower_provider.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class FlowerDetailsPage extends StatelessWidget {
  final String id;
  const FlowerDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flower = Provider.of<FlowerProvider>(context, listen: false).findById(id);
    final favProv = Provider.of<FavoritesProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);

    if (flower == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not found')),
        body: const Center(child: Text('Flower not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(flower.name),
        actions: [
          IconButton(
            icon: Icon(favProv.isFavorite(flower.id) ? Icons.star : Icons.star_border),
            onPressed: () => favProv.toggleFavorite(flower.id),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(flower.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: settings.fontSize + 4)),
            const SizedBox(height: 8),
            Text('Scientific: ${flower.scientificName}', style: TextStyle(fontSize: settings.fontSize)),
            const SizedBox(height: 8),
            _sectionTitle(context, 'Overview'),
            Text('Color: ${flower.color}', style: TextStyle(fontSize: settings.fontSize)),
            Text('Region: ${flower.region}', style: TextStyle(fontSize: settings.fontSize)),
            Text('Bloom time: ${flower.bloomTime}', style: TextStyle(fontSize: settings.fontSize)),
            const SizedBox(height: 8),
            Text(flower.description, style: TextStyle(fontSize: settings.fontSize)),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Uses'),
            ...flower.uses.map((u) => Text('• $u', style: TextStyle(fontSize: settings.fontSize))),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Care'),
            Text('Water: ${flower.care['water']}', style: TextStyle(fontSize: settings.fontSize)),
            Text('Sunlight: ${flower.care['sunlight']}', style: TextStyle(fontSize: settings.fontSize)),
            Text('Soil: ${flower.care['soil']}', style: TextStyle(fontSize: settings.fontSize)),
            Text('Temperature: ${flower.care['temperature']}', style: TextStyle(fontSize: settings.fontSize)),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Fun Facts'),
            ...flower.facts.map((fct) => Text('• $fct', style: TextStyle(fontSize: settings.fontSize))),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext ctx, String t) =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 6.0), child: Text(t, style: Theme.of(ctx).textTheme.titleMedium));
}
