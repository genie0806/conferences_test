import 'package:conference_test/api_model.dart';
import 'package:conference_test/list_tile.dart';
import 'package:conference_test/model/conference_model';
import 'package:conference_test/page/detail_page.dart';
import 'package:flutter/material.dart';

class ConferencesList extends StatelessWidget {
  const ConferencesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conferences',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          FutureBuilder<List<ConferenceModel>>(
            future: fetchConference(),
            initialData: [],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SizedBox(
                  child: CircularProgressIndicator(),
                  width: 200,
                  height: 200,
                ));
              }
              if (snapshot.hasError) {
                return Text('에러가 발생했습니다.');
              }
              if (!snapshot.hasData) {
                return Text('데어터가 없습니다.');
              }

              List<ConferenceModel> conferences = snapshot.data;
              return Column(children: [
                ...conferences
                    .map(
                      (e) => ListTileForm(
                        name: e.name,
                        location: e.location,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConferenceDetail(
                                Conferencedata: e,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList()
              ]);
            },
          ),
        ],
      ),
    );
  }
}
