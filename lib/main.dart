import 'package:cupfox/common/widgets/category/index.dart';
import 'package:cupfox/pages/home/index.dart';
import 'package:flutter/material.dart';
import './route.dart';
import './common/widgets/search_bar/index.dart';
import './common/widgets/app_bar/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cup Fox',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute);
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: const Column(
        children: [CupSearchBar(), CupCategory(), Expanded(child: HomePage())],
      ),
    );
  }
}
