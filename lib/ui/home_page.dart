import 'package:flutter/material.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/network/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<NewsApiModel> newsOnject;

  @override
  void initState() {
    newsOnject = Network().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News '),
      ),
      body: FutureBuilder(
        future: newsOnject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Center(
              child: Text('All Good'),
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
