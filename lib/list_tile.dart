import 'package:flutter/material.dart';

class ListTileForm extends StatelessWidget {
  final String name;
  final String location;
  const ListTileForm({Key key, this.name, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(location),
    );
  }
}
