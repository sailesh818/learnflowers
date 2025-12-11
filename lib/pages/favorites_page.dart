
// -----------------------------
// Favorites Page
// -----------------------------
import 'package:flutter/material.dart';
import 'package:learn_flowers/model/flower_model.dart';
import 'package:learn_flowers/pages/flower_details_page.dart';
import 'package:learn_flowers/providers/favorites_provider.dart';
import 'package:learn_flowers/providers/flower_provider.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favProv = Provider.of<FavoritesProvider>(context);
    final flowerProv = Provider.of<FlowerProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);
    final favs = favProv.favIds.map((id) => flowerProv.findById(id)).whereType<Flower>().toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favs.isEmpty
          ? const Center(child: Text('No favorites yet. Add from All Flowers.'))
          : ListView.builder(
              itemCount: favs.length,
              itemBuilder: (ctx, i) {
                final f = favs[i];
                return Card(
                  child: ListTile(
                    title: Text(f.name, style: TextStyle(fontSize: settings.fontSize)),
                    subtitle: Text('${f.color} • ${f.region}'),
                    trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (_) => FlowerDetailsPage(id: f.id)))),
                  ),
                );
              },
            ),
    );
  }
}
