import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/onboarding_controller.dart';
import 'onboarding_allergy_screen.dart';

class OnboardingHealthScreen extends StatefulWidget {
  const OnboardingHealthScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingHealthScreen> createState() => _OnboardingHealthScreenState();
}

class _OnboardingHealthScreenState extends State<OnboardingHealthScreen> {
  final List<String> _options = [
    'Diyabet / Prediyabet',
    'Hipertansiyon (yüksek tansiyon)',
    'Kolesterol yüksekliği',
    'Kalp-damar hastalığı',
    'Böbrek hastalığı',
    'Çölyak / Gluten hassasiyeti',
    'Laktoz intoleransı',
    'Aşırı kilo / obezite',
  ];

  final Set<String> _selected = {};

  void _toggle(String item) {
    setState(() {
      if (_selected.contains(item)) {
        _selected.remove(item);
      } else {
        _selected.add(item);
      }
    });
  }

  void _next() {
    final controller = context.read<OnboardingController>();
    controller.updateHealthConditions(_selected.toList());

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const OnboardingAllergyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sağlık Durumun'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Aşağıdaki durumlardan hangileri sende var?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    final item = _options[index];
                    final selected = _selected.contains(item);
                    return CheckboxListTile(
                      value: selected,
                      title: Text(item),
                      onChanged: (_) => _toggle(item),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: const Text('Devam Et'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
