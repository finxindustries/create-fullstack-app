import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:____template_placeholder_____client_user_flutter/app/top_level_providers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignIn());
  }
}

class SignIn extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authProvider);
    final email = useTextEditingController(text: 'Email');
    final password = useTextEditingController(text: 'Password');

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(controller: email),
          TextField(controller: password),
          RaisedButton(
            child: const Text('Login'),
            onPressed: () => auth.login(email.value.text, password.value.text),
          ),
        ]);
  }
}
