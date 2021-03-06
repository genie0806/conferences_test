import 'package:flutter/material.dart';
import 'package:conference_test/model/conference_model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ConferenceDetail extends StatelessWidget {
  final ConferenceModel conferencedata;
  const ConferenceDetail({Key? key, required this.conferencedata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yMMMd');
    String formatStartdate =
        dateFormat.format(DateTime.parse(conferencedata.start));
    String formatEnddate =
        dateFormat.format(DateTime.parse(conferencedata.end));
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text(
                  conferencedata.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Text(
                conferencedata.location,
                style: const TextStyle(fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Text(
                formatStartdate + ' ~ ' + formatEnddate,
                style: const TextStyle(fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
              child: TextButton(
                onPressed: () {
                  launch(conferencedata.link);
                },
                child: const Text(
                  'Go to official website',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void launchUrl(String url) async {
    await canLaunch(conferencedata.link)
        ? await launch(conferencedata.link,
            forceSafariVC: true, forceWebView: true)
        : throw 'could not launch ${conferencedata.link}';
  }
}
