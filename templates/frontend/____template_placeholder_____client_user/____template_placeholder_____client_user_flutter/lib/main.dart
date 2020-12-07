import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:____template_placeholder_____client_user_flutter/theme.dart';
import 'package:____template_placeholder_____client_user_flutter/app/top_level_providers.dart';
import 'package:____template_placeholder_____client_user_flutter/services/shared_preferences_service.dart';
import 'package:____template_placeholder_____client_user_flutter/app/home/home_page.dart';
import 'package:____template_placeholder_____client_user_flutter/app/onboarding/onboarding_page.dart';
import 'package:____template_placeholder_____client_user_flutter/app/onboarding/onboarding_view_model.dart';
import 'package:____template_placeholder_____client_user_flutter/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesServiceProvider.overrideWithValue(
        SharedPreferencesService(sharedPreferences),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.read(authProvider);
    bool isIos;
    try {
      isIos = Platform.isIOS;
    } catch (e) {
      isIos = false; // is web since dart:io not available for Platform.isIOS
    }

    return MaterialApp(
      theme: isIos ? iosLightTheme : androidLightTheme,
      darkTheme: isIos ? iosDarkTheme : androidDarkTheme,
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, watch, _) {
          final didCompleteOnboarding =
              watch(onboardingViewModelProvider.state);
          return didCompleteOnboarding ? HomePage() : OnboardingPage();
        },
      ),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, auth),
    );
  }
}
