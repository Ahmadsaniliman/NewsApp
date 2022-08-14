import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/model.dart';
// import 'package:newsapp/util/util.dart';
import 'dart:developer' as devtool show log;

class Network {
  Future<NewsModel> getNews() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-07-11&sortBy=publishedAt&apiKey=b786bc4553bb45a3b45ba1b3a2c8377b';

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
      return NewsModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Something went wrong');
    }
  }
}
