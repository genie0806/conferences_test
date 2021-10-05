import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:conference_test/model/conference_model';

const conferenceUrl =
    'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';

Future<List<ConferenceModel>> fetchConference() async {
  final response = await http.get(Uri.parse(conferenceUrl));
  Iterable jsonResponse = convert.jsonDecode(response.body);
  List<ConferenceModel> conferences =
      jsonResponse.map((e) => ConferenceModel.fromJson(e)).toList();

  return conferences;
}
