import 'package:cupfox/common/value/colors.dart';
import 'package:flutter/material.dart';

class CupSearchBar extends StatefulWidget {
  const CupSearchBar({super.key});

  @override
  State<CupSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<CupSearchBar> {
  var searchContent = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 3,
                  spreadRadius: 0.5,
                  color: Color.fromRGBO(64, 60, 3, 0.3))
            ]),
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: TextField(
                maxLines: 1,
                autofocus: false,
                decoration: const InputDecoration(
                    hintText: '剧集/电影/动漫/综艺...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    isCollapsed: true),
                onSubmitted: (value) {
                  Navigator.pushNamed(context, '/detail',
                      arguments: {'doubanId': '', 'title': value});
                },
              ),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: colorsMap['PrimaryColor']))
          ],
        ));
  }
}
