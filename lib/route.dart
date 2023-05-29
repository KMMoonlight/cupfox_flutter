import 'package:cupfox/pages/detail/index.dart';
import 'package:cupfox/pages/player/index.dart';
import 'package:flutter/material.dart';

import './pages/home/index.dart';
import './pages/find/index.dart';

var routes = {
  '/home': (context) => const HomePage(),
  '/find': (context, {arguments}) => FindPage(category: arguments['category']),
  '/detail': (context, {arguments}) => CupfoxMediaDetailPage(
        doubanId: arguments['doubanId'],
        title: arguments['title'],
      ),
  '/player': (context, {arguments}) => CupfoxPlayer(
        playerUrl: arguments['playerUrl'],
      )
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;

  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
