import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:cupfox/common/api/home_api.dart';
import 'package:cupfox/common/entity/home_recommend.dart';
import 'package:cupfox/common/value/colors.dart';
import 'package:cupfox/common/widgets/media_list/index.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeRecommend _homePageData = HomeRecommend();

  @override
  void initState() {
    super.initState();

    getToken().then((value) {
      var document = parse(value.data!);
      var scriptDOM = document.getElementById('__NEXT_DATA__');
      var tokenData = scriptDOM?.text;
      if (tokenData != null) {
        var tokenJson = jsonDecode(tokenData.replaceAll("\n", "").trim());
        setState(() {
          _homePageData = HomeRecommend.fromJson(tokenJson['props']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //filter empty data
    var bannerList = _homePageData.pageProps?.homeResult?.banners?.m ?? [];
    bannerList.retainWhere((element) {
      return element.name != "";
    });

    var mediaRecommend = _homePageData.pageProps?.homeResult?.recommend;

    return Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            buildSwiper(bannerList, context),
            const SizedBox(
              height: 10,
            ),
            buildCategoryList('热播新剧', mediaRecommend?.tvHot?.subjects ?? []),
            buildCategoryList('热门电影', mediaRecommend?.movie?.subjects ?? []),
            buildCategoryList(
                '热播动漫', mediaRecommend?.tvAnimation?.subjects ?? []),
            buildCategoryList('热播综艺', mediaRecommend?.tvShow?.subjects ?? []),
            buildCategoryList('热播纪录片', mediaRecommend?.tvRecord?.subjects ?? [])
          ],
        ));
  }
}

Widget buildSwiper(List<M> data, BuildContext context) {
  return data.length != 0
      ? SizedBox(
          height: 200,
          child: Swiper(
            onTap: (index) {
              var currentBanner = data[index];
              Navigator.pushNamed(context, '/detail',
                  arguments: {'doubanId': '', 'title': currentBanner.name});
            },
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(data[index].img!, fit: BoxFit.fill),
              );
            },
            itemCount: data.length,
            pagination: SwiperPagination(
                margin: EdgeInsets.zero,
                builder: SwiperCustomPagination(builder: (context, config) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints.expand(height: 30.0),
                    child: Container(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${data[config.activeIndex].name}',
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  );
                })),
          ),
        )
      : Container();
}

Widget buildCategoryList(String title, List<Subjects> subjects) {
  return Column(
    children: [
      SizedBox(
        height: 40,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colorsMap['FontLabelColor']),
          ),
        ),
      ),
      CupfoxMediaList(subjectsList: subjects)
    ],
  );
}
