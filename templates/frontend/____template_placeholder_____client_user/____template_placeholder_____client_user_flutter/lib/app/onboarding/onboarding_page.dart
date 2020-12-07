import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:____template_placeholder_____client_user_flutter/app/onboarding/onboarding_view_model.dart';

class OnboardingPage extends StatelessWidget {
  Future<void> onGetStarted(BuildContext context) async {
    final onboardingViewModel = context.read(onboardingViewModelProvider);
    await onboardingViewModel.completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const FractionallySizedBox(
              widthFactor: 0.5,
              child: Icon(Icons.bubble_chart),
            ),
            RaisedButton(
              onPressed: () => onGetStarted(context),
              child: Text('Let\'s go'),
            ),
          ],
        ),
      ),
    );
  }
}
