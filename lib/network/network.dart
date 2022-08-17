import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/model.dart';
// import 'package:newsapp/util/util.dart';
import 'dart:developer' as devtool show log;

class Network {
  Future<NewsApiModel> getNews() async {
    const url =
        'https://newsdata.io/api/1/news?apikey=pub_103549a091c6757a5cf7e38e4056fdf7ff5a5&q=pegasus&language=en';

    final response = await get(
      Uri.parse(
        Uri.encodeFull(url),
      ),
    );
    if (response.statusCode == 200) {
      devtool.log(url);
      devtool.log(
        Uri.encodeFull(response.body),
      );
      return NewsApiModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Something went wrong');
    }
  }
}
