import 'package:flutter/material.dart';

class ListTileForm extends StatelessWidget {
  final String name;
  final String location;
  final Function() onTap;
  const ListTileForm(
      {Key? key,
      required this.name,
      required this.location,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          location,
          style: const TextStyle(color: Colors.black),
        ),
        onTap: onTap,
      ),
    );
  }
}
