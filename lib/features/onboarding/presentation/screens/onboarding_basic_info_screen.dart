import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../onboarding/state/onboarding_controller.dart';
import 'onboarding_health_screen.dart';

class OnboardingBasicInfoScreen extends StatefulWidget {
  const OnboardingBasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingBasicInfoScreen> createState() =>
      _OnboardingBasicInfoScreenState();
}

class _OnboardingBasicInfoScreenState extends State<OnboardingBasicInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  String _gender = 'Belirtmek istemiyorum';

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_formKey.currentState?.validate() ?? false) {
      final age = int.tryParse(_ageController.text);

      // Controller’a kaydet
      final controller = context.read<OnboardingController>();
      controller.updateBasicInfo(
        age: age,
        gender: _gender,
      );

      // Sonraki ekrana geç
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const OnboardingHealthScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seni Daha İyi Tanıyalım'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Yaşın kaç?',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen yaşını gir.';
                    }
                    final age = int.tryParse(value);
                    if (age == null || age < 0 || age > 120) {
                      return 'Geçerli bir yaş gir.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: const InputDecoration(
                    labelText: 'Cinsiyetin nedir?',
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Kadın',
                      child: Text('Kadın'),
                    ),
                    DropdownMenuItem(
                      value: 'Erkek',
                      child: Text('Erkek'),
                    ),
                    DropdownMenuItem(
                      value: 'Belirtmek istemiyorum',
                      child: Text('Belirtmek istemiyorum'),
                    ),
                  ],
                  onChanged: (val) {
                    if (val == null) return;
                    setState(() {
                      _gender = val;
                    });
                  },
                ),
                const Spacer(),
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
      ),
    );
  }
}
