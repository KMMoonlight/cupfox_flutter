import 'dart:convert';

import 'package:cupfox/common/api/home_api.dart';
import 'package:cupfox/common/entity/media_detail.dart';
import 'package:cupfox/common/tools/build_tools.dart';
import 'package:cupfox/common/value/colors.dart';
import 'package:cupfox/common/widgets/app_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../../common/value/shadow.dart';

class CupfoxMediaDetailPage extends StatefulWidget {
  final String doubanId;
  final String title;

  const CupfoxMediaDetailPage(
      {super.key, required this.doubanId, required this.title});

  @override
  State<CupfoxMediaDetailPage> createState() => _CupfoxMediaDetailPageState();
}

class _CupfoxMediaDetailPageState extends State<CupfoxMediaDetailPage> {
  MediaDetail mediaDetail = MediaDetail();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getMediaDetailData(widget.title).then((value) {
      setState(() {
        var document = parse(value.data!);
        var scriptDOM = document.getElementById('__NEXT_DATA__');
        var tokenData = scriptDOM?.text;
        if (tokenData != null) {
          var tokenJson = jsonDecode(tokenData.replaceAll("\n", "").trim());
          setState(() {
            mediaDetail = MediaDetail.fromJson(tokenJson['props']);
          });
        }

        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Subject? subject = mediaDetail.pageProps?.resourceSearchResult?.subject;
    List<Resources>? resourceList =
        mediaDetail.pageProps?.resourceSearchResult?.resources;

    return Scaffold(
      appBar: buildCommonAppBar(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: colorsMap['PrimaryColor'],
              ),
            )
          : Column(
              children: [
                buildMediaInfo(subject ?? Subject()),
                Expanded(child: buildMediaPlayList(resourceList ?? []))
              ],
            ),
    );
  }
}

Widget buildMediaInfo(Subject subject) {
  return subject.title != '' && subject.title != null
      ? Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [containerShadow],
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(4),
          height: 232,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 145,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(subject.cover!, fit: BoxFit.fitHeight),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          subject.title!,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: colorsMap['FontLabelColor']),
                        ),
                        Text(
                          subject.info!,
                          style: TextStyle(
                              fontSize: 12, color: colorsMap['InfoTextColor']),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 24,
                          child: buildRateWidget(
                              double.parse(subject.rating == ''
                                  ? '0'
                                  : subject.rating ?? '0'),
                              position: 1,
                              size: 20),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: colorsMap['DividerColor'],
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  subject.comment!,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: colorsMap['InfoTextColor'], fontSize: 14),
                ),
              ))
            ],
          ),
        )
      : Container();
}

Widget buildMediaPlayList(List<Resources> resourceList) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
    decoration: BoxDecoration(
        boxShadow: [containerShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
    child: ListView.builder(
      itemBuilder: (context, index) {
        var currentResource = resourceList[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/player',
                arguments: {'playerUrl': currentResource.url});
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: colorsMap['DividerColor']!))),
            height: 40,
            child: Row(
              children: [
                Image.network(
                  currentResource.icon!,
                  fit: BoxFit.fill,
                  width: 24,
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(currentResource.website!),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: resourceList.length,
    ),
  );
}
