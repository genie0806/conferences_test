import 'package:conference_test/date_Format.dart';
import 'package:flutter/material.dart';
import 'package:conference_test/api_model.dart';
import 'package:conference_test/list_tile.dart';
import 'package:conference_test/model/conference_model';
import 'package:intl/intl.dart';

class ConferenceDetail extends StatelessWidget {
  final ConferenceModel conferencedata;
  const ConferenceDetail({Key key, this.conferencedata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yMMMd');
    String formatStart =
        dateFormat.format(DateTime.parse(conferencedata.start));
    String formatEnd = dateFormat.format(DateTime.parse(conferencedata.end));
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text(
                  conferencedata.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Text(
                conferencedata.location,
                style: TextStyle(fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Text(
                '${formatStart + '~' + formatEnd}',
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
