import 'package:conference_test/page/list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConferencesTest());
}

class ConferencesTest extends StatelessWidget {
  const ConferencesTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ConferencesTest', home: ConferencesList());
  }
}
