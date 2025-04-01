import 'dart:async';

import 'package:cypher/cypher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final StreamSubscription<PasswordStatus> _subscription;

  PasswordStatus _status = PasswordStatus();

  @override
  void initState() {
    _subscription = Cypher.onPasswordStatusChange.listen(_onStatusChange);
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: Cypher.onPasswordChanged,
              decoration: InputDecoration(
                labelText: 'Enter a password',
              ),
            ),
          ),
          CheckboxListTile(
            value: _status.hasDigits,
            title: Text('Has digits'),
            onChanged: null,
            enabled: false,
            checkColor: Colors.white,
          ),
          CheckboxListTile(
            value: _status.hasPunctuation,
            title: Text('Has punctuation'),
            onChanged: null,
          ),
          CheckboxListTile(
            value: _status.hasLowerCase,
            title: Text('Has lowerCases'),
            onChanged: null,
          ),
          CheckboxListTile(
            value: _status.hasUpperCase,
            title: Text('Has upperCases'),
            onChanged: null,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final password = Cypher.create(length: 12);
          await showDialog(context: context, builder: (context) {
            return AlertDialog(
              content: Text(password),
            );
          });
        },
        label: Text('Generate a password'),
      ),
    );
  }

  void _onStatusChange(PasswordStatus status) {
    setState(() {
      _status = status;
    });
  }
}
