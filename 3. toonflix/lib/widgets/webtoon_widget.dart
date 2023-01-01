import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({
    Key? key,
    required this.webtoon,
  }) : super(key: key);

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(webtoon: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Image.network(webtoon.thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          // Text(webtoon.thumb),
          // Text(webtoon.id),
        ],
      ),
    );
  }
}
