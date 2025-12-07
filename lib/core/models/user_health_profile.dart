class UserHealthProfile {
  final int? age;
  final String? gender;
  final List<String> healthConditions;
  final List<String> allergies;
  final String? dietStyle;
  final List<String> avoidIngredients;
  final String? mainGoal;

  const UserHealthProfile({
    this.age,
    this.gender,
    this.healthConditions = const [],
    this.allergies = const [],
    this.dietStyle,
    this.avoidIngredients = const [],
    this.mainGoal,
  });

  UserHealthProfile copyWith({
    int? age,
    String? gender,
    List<String>? healthConditions,
    List<String>? allergies,
    String? dietStyle,
    List<String>? avoidIngredients,
    String? mainGoal,
  }) {
    return UserHealthProfile(
      age: age ?? this.age,
      gender: gender ?? this.gender,
      healthConditions: healthConditions ?? this.healthConditions,
      allergies: allergies ?? this.allergies,
      dietStyle: dietStyle ?? this.dietStyle,
      avoidIngredients: avoidIngredients ?? this.avoidIngredients,
      mainGoal: mainGoal ?? this.mainGoal,
    );
  }
}
