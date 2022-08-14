import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/util/util.dart';

class Network {
  Future<NewsModel> getNews() async {
    final url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-07-11&sortBy=publishedAt&apiKey=${Util.apiKey}';

    final Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Something went wrong');
    }
  }
}
