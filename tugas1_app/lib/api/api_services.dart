import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugas1_app/user_model.dart';

class FetchUser {
  var data = [];
  List<UserList> results = [];
  String fetchUrl = "https://jsonplaceholder.typicode.com/users";
  Future<List<UserList>> getUserList(String? query) async {
    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => UserList.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.name!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        // ignore: avoid_print
        print('api error!');
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print('error : $e');
    }
    return results;
  }
}
