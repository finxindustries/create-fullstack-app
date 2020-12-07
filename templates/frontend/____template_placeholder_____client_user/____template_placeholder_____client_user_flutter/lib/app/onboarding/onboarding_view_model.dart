import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:____template_placeholder_____client_user_flutter/services/shared_preferences_service.dart';

final onboardingViewModelProvider =
    StateNotifierProvider<OnboardingViewModel>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  return OnboardingViewModel(sharedPreferencesService);
});

class OnboardingViewModel extends StateNotifier<bool> {
  OnboardingViewModel(this.sharedPreferencesService)
      : super(sharedPreferencesService.isOnboardingComplete());
  final SharedPreferencesService sharedPreferencesService;

  Future<void> completeOnboarding() async {
    await sharedPreferencesService.setOnboardingComplete();
    state = true;
  }

  bool get isOnboardingComplete => state;
}