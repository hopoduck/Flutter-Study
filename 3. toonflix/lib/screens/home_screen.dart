import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: makeList(snapshot),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(webtoon: webtoon);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
