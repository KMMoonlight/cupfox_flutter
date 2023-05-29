import 'package:cupfox/common/widgets/media_item/index.dart';
import 'package:flutter/material.dart';
import '../../entity/home_recommend.dart';

class CupfoxMediaList extends StatelessWidget {
  final List<Subjects> subjectsList;

  const CupfoxMediaList({super.key, required this.subjectsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: subjectsList.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.1 / 2.0 //宽高比为1时，子widget
            ),
        itemBuilder: (BuildContext context, int index) {
          Subjects currentSubject = subjectsList[index];
          return CupfoxMediaItem(
              imageUrl: currentSubject.cover!,
              mediaName: currentSubject.title!,
              mediaRate: double.parse(
                  currentSubject.rating == '' ? '0' : currentSubject.rating!),
              doubanId: currentSubject.doubanId!);
        });
  }
}

class CupfoxMediaControlList extends StatefulWidget {
  final List<Subjects> subjectsList;
  final Function notify;

  const CupfoxMediaControlList(
      {super.key, required this.subjectsList, required this.notify});

  @override
  State<CupfoxMediaControlList> createState() => _CupfoxMediaControlListState();
}

class _CupfoxMediaControlListState extends State<CupfoxMediaControlList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //滑动到了最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        widget.notify();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: widget.subjectsList.length,
        controller: _controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.1 / 2.0 //宽高比为1时，子widget
            ),
        itemBuilder: (BuildContext context, int index) {
          Subjects currentSubject = widget.subjectsList[index];
          return CupfoxMediaItem(
              imageUrl: currentSubject.cover!,
              mediaName: currentSubject.title!,
              mediaRate: double.parse(
                  currentSubject.rating == '' ? '0' : currentSubject.rating!),
              doubanId: currentSubject.doubanId!);
        });
  }
}
