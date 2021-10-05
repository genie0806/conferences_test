import 'package:flutter/material.dart';
import 'package:conference_test/api_model.dart';
import 'package:conference_test/list_tile.dart';
import 'package:conference_test/model/conference_model';

class ConferenceDetail extends StatelessWidget {
  final ConferenceModel Conferencedata;
  const ConferenceDetail({Key key, this.Conferencedata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Conferencedata.location),
      ],
    );
  }
}
