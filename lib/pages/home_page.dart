import 'package:flutter/material.dart';
import 'package:learn_flowers/pages/all_flowers_page.dart';
import 'package:learn_flowers/pages/flower_details_page.dart';
import 'package:learn_flowers/pages/quiz_home_page.dart';
import 'package:learn_flowers/providers/flower_provider.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flowerProv = Provider.of<FlowerProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);
    final popular = flowerProv.flowers.take(6).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Learn Flowers')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search flowers by name, scientific name, color, region',
                  border: OutlineInputBorder()),
              onChanged: (q) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AllFlowersPage(search: q))),
            ),
            const SizedBox(height: 12),
            Text('Flower of the Day', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Text('🌼')),
                title: Text(popular[0].name, style: TextStyle(fontSize: settings.fontSize)),
                subtitle: Text(popular[0].description, maxLines: 3, overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FlowerDetailsPage(id: popular[0].id)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Flowers', style: Theme.of(context).textTheme.titleMedium),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllFlowersPage())),
                  child: const Text('See all'),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: popular.length,
                itemBuilder: (ctx, i) {
                  final f = popular[i];
                  return Card(
                    child: ListTile(
                      title: Text(f.name, style: TextStyle(fontSize: settings.fontSize)),
                      subtitle: Text('${f.color} • ${f.region}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => FlowerDetailsPage(id: f.id))),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.quiz),
        label: const Text('Start Quiz'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizHomePage()));
        },
      ),
    );
  }
}