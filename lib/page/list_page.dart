import 'package:conference_test/api_model.dart';
import 'package:conference_test/list_tile.dart';
import 'package:conference_test/model/conference_model.dart';
import 'package:conference_test/page/detail_page.dart';
import 'package:flutter/material.dart';

class ConferencesList extends StatelessWidget {
  const ConferencesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conferences',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<ConferenceModel>>(
        future: fetchConference(),
        initialData: const [],
        builder: (BuildContext context,
            AsyncSnapshot<List<ConferenceModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
              width: 200,
              height: 200,
            ));
          }
          if (snapshot.hasError) {
            return const Text('에러가 발생했습니다.');
          }
          if (!snapshot.hasData) {
            return const Text('데어터가 없습니다.');
          }

          List<ConferenceModel> conferences = snapshot.data ?? [];
          return Column(
              children: conferences
                  .map(
                    (e) => ListTileForm(
                      name: e.name,
                      location: e.location,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConferenceDetail(
                              conferencedata: e,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList());
        },
      ),
    );
  }
}
