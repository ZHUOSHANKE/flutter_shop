import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class CustomRefresh extends StatefulWidget {
  final Widget childWidget;

  final OnRefreshCallback onRefresh;

  final OnLoadCallback onLoad;
  final bool firstRefresh;
  final EasyRefreshController controller;
  final ScrollController scrollController;
  final Header header;
  final Footer footer;

  const CustomRefresh(
      {Key key,
      this.childWidget,
      this.onRefresh,
      this.onLoad,
      this.firstRefresh = true,
      this.controller,
      this.header,
      this.footer,
      this.scrollController})
      : super(key: key);

  @override
  _CustomRefreshState createState() => _CustomRefreshState();
}

class _CustomRefreshState extends State<CustomRefresh> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: widget.controller,
      header: widget.header == null
          ? ClassicalHeader(
              refreshedText: "刷新完成",
              refreshReadyText: "松开刷新",
              refreshingText: "刷新中...",
              refreshText: "下拉刷新")
          : widget.header,
      footer: ClassicalFooter(
          loadedText: "加载完成",
          loadReadyText: "松开加载",
          loadingText: "加载中...",
          loadText: "上拉加载",
          noMoreText: "我是有底线的"),
      child: widget.childWidget,
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
      firstRefresh: widget.firstRefresh,
      scrollController: widget.scrollController,
    );
  }
}
