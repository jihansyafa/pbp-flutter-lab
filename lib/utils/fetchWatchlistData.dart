import 'package:http/http.dart' as http;
import 'package:counter_7/model/mywatchlist.dart';
import 'dart:convert';


Future<List<MyWatchList>> fetchWatchList() async {
  var url = Uri.parse(
      'https://pbp-tugas2-jihansyafakamila.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchList> listWatchList = [];
  for (var d in data) {
    if (d != null) {
      listWatchList.add(MyWatchList.fromJson(d));
    }
  }

  return listWatchList;
}