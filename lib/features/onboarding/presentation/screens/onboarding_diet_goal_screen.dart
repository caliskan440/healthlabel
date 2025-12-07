import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/onboarding_controller.dart';
import '../../../../home/presentation/home_screen.dart';

class OnboardingDietGoalScreen extends StatefulWidget {
  const OnboardingDietGoalScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingDietGoalScreen> createState() =>
      _OnboardingDietGoalScreenState();
}

class _OnboardingDietGoalScreenState extends State<OnboardingDietGoalScreen> {
  String? _dietStyle = 'Özel bir programım yok';
  String? _mainGoal = 'Daha sağlıklı beslenmek istiyorum';

  final List<String> _dietOptions = [
    'Özel bir programım yok',
    'Vejetaryen',
    'Vegan',
    'Pesketeriyan',
    'Düşük karbonhidratlı',
    'Keto',
    'Glütensiz beslenmeye dikkat ediyorum',
    'Şekersiz / şekeri azaltmaya çalışıyorum',
  ];

  final List<String> _goalOptions = [
    'Kilo vermek istiyorum',
    'Kilomu korumak istiyorum',
    'Kilo almak istiyorum',
    'Daha sağlıklı beslenmek istiyorum',
  ];

  void _finish() {
    final controller = context.read<OnboardingController>();

    controller.updateDietStyle(_dietStyle);
    controller.updateMainGoal(_mainGoal);
    controller.completeOnboarding();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beslenme Tarzın & Hedefin'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _dietStyle,
                decoration: const InputDecoration(
                  labelText: 'Beslenme tarzın',
                ),
                items: _dietOptions
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _dietStyle = val;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _mainGoal,
                decoration: const InputDecoration(
                  labelText: 'Temel hedefin',
                ),
                items: _goalOptions
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _mainGoal = val;
                  });
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _finish,
                  child: const Text('Profili Tamamla'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
