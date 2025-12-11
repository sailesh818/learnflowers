
// -----------------------------
// Settings Page
// -----------------------------
import 'package:flutter/material.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: settings.isDark,
              onChanged: (_) => settings.toggleTheme(),
            ),
            const SizedBox(height: 12),
            Text('Font Size: ${settings.fontSize.toInt()}'),
            Slider(
              min: 12,
              max: 24,
              divisions: 6,
              value: settings.fontSize,
              onChanged: settings.setFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
