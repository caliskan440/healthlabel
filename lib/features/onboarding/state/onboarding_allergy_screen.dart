import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/onboarding_controller.dart';
import 'onboarding_diet_goal_screen.dart';

class OnboardingAllergyScreen extends StatefulWidget {
  const OnboardingAllergyScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingAllergyScreen> createState() =>
      _OnboardingAllergyScreenState();
}

class _OnboardingAllergyScreenState extends State<OnboardingAllergyScreen> {
  final List<String> _options = [
    'Süt / Laktoz',
    'Yumurta',
    'Yer fıstığı',
    'Fındık / ağaç yemişleri',
    'Soya',
    'Gluten / Buğday',
    'Balık / Deniz ürünleri',
    'Susam',
    'Soya lesitini (E322)',
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
    controller.updateAllergies(_selected.toList());

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const OnboardingDietGoalScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerjilerin'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hangi besinlere karşı alerjin veya hassasiyetin var?',
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
