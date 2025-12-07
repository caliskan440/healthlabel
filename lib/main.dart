import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/onboarding/presentation/screens/onboarding_start_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/onboarding/state/onboarding_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OnboardingController(),
      child: const HealthLabelAssistantApp(),
    ),
  );
}

class HealthLabelAssistantApp extends StatelessWidget {
  const HealthLabelAssistantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlık Etiket Asistanı',
      theme: AppTheme.light,
      home: const OnboardingStartScreen(),
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
