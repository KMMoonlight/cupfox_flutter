import 'dart:convert';

import 'package:cupfox/common/entity/home_recommend.dart';
import 'package:cupfox/common/widgets/app_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../../common/api/home_api.dart';
import '../../common/value/colors.dart';
import '../../common/widgets/media_list/index.dart';

var dropDownMenuData = {
  "电影": {
    "类型": [
      "全部类型",
      "喜剧",
      "爱情",
      "动作",
      "科幻",
      "奇幻",
      "动画",
      "悬疑",
      "犯罪",
      "恐怖",
      "战争",
      "音乐",
      "歌舞",
      "历史",
      "传记",
      "灾难",
      "纪录片",
      "短片"
    ],
    "地区": [
      "全部地区",
      "华语",
      "欧美",
      "韩国",
      "日本",
      "中国大陆",
      "美国",
      "中国香港",
      "中国台湾",
      "英国",
      "法国",
      "意大利",
      "西班牙",
      "印度",
      "泰国"
    ],
    "年代": [
      "全部年代",
      "2023",
      "2022",
      "2021",
      "2020",
      "2010年代",
      "2000年代",
      "90年代",
      "80年代",
      "70年代",
      "60年代",
      "更早"
    ],
    "排序": ["近期热度", "高分优先"]
  },
  "电视剧": {
    "类型": ["全部类型", "喜剧", "爱情", "科幻", "奇幻", "古装", "悬疑", "恐怖", "战争", "纪录片"],
    "地区": ["全部地区", "华语", "欧美", "韩国", "日本", "美国", "英国", "泰国"],
    "年代": [
      "全部年代",
      "2023",
      "2022",
      "2021",
      "2020",
      "2010年代",
      "2000年代",
      "90年代",
      "80年代",
      "70年代",
      "60年代",
      "更早"
    ],
    "排序": ["近期热度", "高分优先"]
  },
  "动漫": {
    "类型": ["全部类型", "喜剧", "爱情", "科幻", "奇幻", "动作"],
    "地区": ["全部地区", "华语", "欧美", "日本"],
    "年代": [
      "全部年代",
      "2023",
      "2022",
      "2021",
      "2020",
      "2010年代",
      "2000年代",
      "90年代",
      "80年代",
      "70年代",
      "60年代",
      "更早"
    ],
    "排序": ["近期热度", "高分优先"]
  },
  "综艺": {
    "类型": ["全部类型", "真人秀", "脱口秀", "音乐", "歌舞"],
    "地区": ["全部地区", "华语", "欧美", "日本", "韩国"],
    "年代": [
      "全部年代",
      "2023",
      "2022",
      "2021",
      "2020",
      "2010年代",
      "2000年代",
      "90年代",
      "80年代",
      "70年代",
      "60年代",
      "更早"
    ],
    "排序": ["近期热度", "高分优先"]
  }
};

class FindPage extends StatefulWidget {
  final String category;

  const FindPage({super.key, required this.category});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  var type = '全部类型';
  var area = '全部地区';
  var age = '全部年代';
  var order = '近期热度';

  List<Subjects> findData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    getFilterPageData(
            category: widget.category,
            type: type,
            area: area,
            age: age,
            order: order)
        .then((value) {
      var document = parse(value.data!);
      var scriptDOM = document.getElementById('__NEXT_DATA__');
      var tokenData = scriptDOM?.text;
      if (tokenData != null) {
        var tokenJson = jsonDecode(tokenData.replaceAll("\n", "").trim());
        var result =
            tokenJson['props']['pageProps']['subjectResult']['subjects'];
        setState(() {
          findData = result.map<Subjects>((cell) {
            return Subjects.fromJson(cell);
          }).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: Column(
        children: [
          buildFilter(widget.category, setType: (value) {
            setState(() {
              type = value;
              findData = [];
            });
            getData();
          }, setAge: (value) {
            setState(() {
              age = value;
              findData = [];
            });
            getData();
          }, setArea: (value) {
            setState(() {
              area = value;
              findData = [];
            });
            getData();
          }, setOrder: (value) {
            setState(() {
              order = value;
              findData = [];
            });
            getData();
          }, type: type, age: age, area: area, order: order),
          Expanded(
              child: findData.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colorsMap['PrimaryColor'],
                      ),
                    )
                  : CupfoxMediaControlList(
                      subjectsList: findData,
                      notify: () {
                        //没有对应的接口 没法实现
                      },
                    ))
        ],
      ),
    );
  }
}

Widget buildFilter(String category,
    {required Function setType,
    required Function setArea,
    required Function setAge,
    required Function setOrder,
    required String type,
    required String area,
    required String age,
    required String order}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      DropdownButton<String>(
          value: type,
          items: buildDropDownItems(category, '类型'),
          onChanged: (String? value) {
            setType(value);
          },
          hint: const Text('类型')),
      DropdownButton<String>(
          value: area,
          items: buildDropDownItems(category, '地区'),
          onChanged: (String? value) {
            setArea(value);
          },
          hint: const Text('地区')),
      DropdownButton<String>(
          value: age,
          items: buildDropDownItems(category, '年代'),
          onChanged: (String? value) {
            setAge(value);
          },
          hint: const Text('年代')),
      DropdownButton<String>(
          value: order,
          items: buildDropDownItems(category, '排序'),
          onChanged: (String? value) {
            setOrder(value);
          },
          hint: const Text('排序')),
    ],
  );
}

List<DropdownMenuItem<String>> buildDropDownItems(
    String category, String type) {
  var list = dropDownMenuData[category]?[type] ?? [];

  return list.map((e) {
    return DropdownMenuItem<String>(
      value: e,
      child: Text(e),
    );
  }).toList();
}
