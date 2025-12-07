import 'package:flutter/foundation.dart';
import '../../../core/models/user_health_profile.dart';

class OnboardingController extends ChangeNotifier {
  UserHealthProfile _profile = const UserHealthProfile();
  bool _completed = false;

  UserHealthProfile get profile => _profile;
  bool get isCompleted => _completed;

  void updateBasicInfo({
    int? age,
    String? gender,
  }) {
    _profile = _profile.copyWith(
      age: age,
      gender: gender,
    );
    notifyListeners();
  }

  void updateHealthConditions(List<String> conditions) {
    _profile = _profile.copyWith(
      healthConditions: conditions,
    );
    notifyListeners();
  }

  void updateAllergies(List<String> allergies) {
    _profile = _profile.copyWith(
      allergies: allergies,
    );
    notifyListeners();
  }

  void updateDietStyle(String? dietStyle) {
    _profile = _profile.copyWith(
      dietStyle: dietStyle,
    );
    notifyListeners();
  }

  void updateAvoidIngredients(List<String> ingredients) {
    _profile = _profile.copyWith(
      avoidIngredients: ingredients,
    );
    notifyListeners();
  }

  void updateMainGoal(String? goal) {
    _profile = _profile.copyWith(
      mainGoal: goal,
    );
    notifyListeners();
  }

  void completeOnboarding() {
    _completed = true;
    // İleride burada local storage / backend kaydı yapabilirsin.
    notifyListeners();
  }
}
