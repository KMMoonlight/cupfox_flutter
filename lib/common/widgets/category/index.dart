import 'package:cupfox/common/value/colors.dart';
import 'package:flutter/material.dart';

import '../../value/shadow.dart';

class CupCategory extends StatelessWidget {
  const CupCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            containerShadow,
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.pushNamed(context, '/find',
                            arguments: {'category': '电视剧'})
                      },
                  icon: Image.asset('lib/assets/images/tv.png',
                      width: 32, height: 32)),
              Text(
                '电视剧',
                style:
                    TextStyle(fontSize: 12, color: colorsMap['FontLabelColor']),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.pushNamed(context, '/find',
                            arguments: {'category': '电影'})
                      },
                  icon: Image.asset('lib/assets/images/movie.png',
                      width: 32, height: 32)),
              Text('电影',
                  style: TextStyle(
                      fontSize: 12, color: colorsMap['FontLabelColor']))
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.pushNamed(context, '/find',
                            arguments: {'category': '动漫'})
                      },
                  icon: Image.asset('lib/assets/images/animation.png',
                      width: 32, height: 32)),
              Text('动漫',
                  style: TextStyle(
                      fontSize: 12, color: colorsMap['FontLabelColor']))
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.pushNamed(context, '/find',
                            arguments: {'category': '综艺'})
                      },
                  icon: Image.asset('lib/assets/images/tv_show.png',
                      width: 32, height: 32)),
              Text('综艺',
                  style: TextStyle(
                      fontSize: 12, color: colorsMap['FontLabelColor']))
            ],
          )
        ],
      ),
    );
  }
}
