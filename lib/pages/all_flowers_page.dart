
// -----------------------------
// All Flowers Page
// -----------------------------
import 'package:flutter/material.dart';
import 'package:learn_flowers/pages/flower_details_page.dart';
import 'package:learn_flowers/providers/flower_provider.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class AllFlowersPage extends StatefulWidget {
  final String? search;
  const AllFlowersPage({Key? key, this.search}) : super(key: key);

  @override
  State<AllFlowersPage> createState() => _AllFlowersPageState();
}

class _AllFlowersPageState extends State<AllFlowersPage> {
  late String _search;

  @override
  void initState() {
    super.initState();
    _search = widget.search ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final flowerProv = Provider.of<FlowerProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);
    final results = _search.isEmpty ? flowerProv.flowers : flowerProv.search(_search);

    return Scaffold(
      appBar: AppBar(title: const Text('All Flowers')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: TextEditingController(text: _search),
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search...'),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (ctx, i) {
                final f = results[i];
                return Card(
                  child: ListTile(
                    title: Text(f.name, style: TextStyle(fontSize: settings.fontSize)),
                    subtitle: Text('${f.scientificName} • ${f.color} • ${f.region}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
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
    );
  }
}
