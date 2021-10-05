import 'package:flutter/material.dart';

class ListTileForm extends StatelessWidget {
  final String name;
  final String location;
  final Function onTap;
  const ListTileForm({Key key, this.name, this.location, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(location),
        onTap: onTap,
      ),
    );
  }
}
