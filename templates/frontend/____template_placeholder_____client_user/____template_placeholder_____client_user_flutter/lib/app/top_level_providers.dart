import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:____template_placeholder_____client_user_flutter/services/auth.dart';

final authProvider = Provider<Auth>((ref) => Auth());

final authStateChangesProvider =
    StreamProvider<bool>((ref) => ref.watch(authProvider).authStateChanges());

final loggerProvider = Provider<Logger>((ref) => Logger(
      printer: PrettyPrinter(
        methodCount: 1,
        printEmojis: false,
      ),
    ));
