import 'package:cupfox/common/value/colors.dart';
import 'package:flutter/material.dart';

import '../../tools/build_tools.dart';

class CupfoxMediaItem extends StatelessWidget {
  final String imageUrl;
  final String mediaName;
  final double mediaRate;
  final String doubanId;

  const CupfoxMediaItem(
      {super.key,
      required this.imageUrl,
      required this.mediaName,
      required this.mediaRate,
      required this.doubanId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1.1 / 2.0,
        child: Container(
          margin: const EdgeInsets.all(4),
          child: Column(
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              )),
              SizedBox(
                height: 20,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    mediaName,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: colorsMap['FontLabelColor'],
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: buildRateWidget(mediaRate),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/detail',
            arguments: {'doubanId': doubanId, 'title': mediaName});
      },
    );
  }
}
