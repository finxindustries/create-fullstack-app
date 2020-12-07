import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:____template_placeholder_____client_user_flutter/app/home/other/empty_content.dart';
import 'package:____template_placeholder_____client_user_flutter/app/top_level_providers.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key key,
    @required this.signedInBuilder,
    @required this.nonSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authStateChanges = watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) => _data(context, user),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: EmptyContent(
          title: 'Something went wrong',
          message: 'Can\'t load data right now.',
        ),
      ),
    );
  }

  Widget _data(BuildContext context, bool loggedIn) {
    if (loggedIn) {
      return signedInBuilder(context);
    }
    return nonSignedInBuilder(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<WidgetBuilder>.has(
        'signedInBuilder', signedInBuilder));
    properties.add(ObjectFlagProperty<WidgetBuilder>.has(
        'nonSignedInBuilder', nonSignedInBuilder));
  }
}
