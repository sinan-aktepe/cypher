import 'package:flutter/material.dart';
import 'package:cypher/cypher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _password = 'No password';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Generated password \n\n $_password',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final String password = await Cypher.create(
                length: 15,
                useDigits: true,
                useLowerCase: true,
                useUpperCase: true,
                usePunctuation: false);
            setState(() {
              _password = password;
            });
          },
        ),
      ),
    );
  }
}
