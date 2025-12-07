import 'package:flutter/material.dart';
import 'onboarding_basic_info_screen.dart';

class OnboardingStartScreen extends StatelessWidget {
  static const routeName = '/onboarding/start';

  const OnboardingStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Hoş Geldin!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Bu uygulama, paketli ürünleri senin sağlık bilgilerine göre değerlendirir.',
              ),
              const SizedBox(height: 24),
              const Text(
                'Birkaç kısa soruyla profili oluşturalım.',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const OnboardingBasicInfoScreen(),
                      ),
                    );
                  },
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
