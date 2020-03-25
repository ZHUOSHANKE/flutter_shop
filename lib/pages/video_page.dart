import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_shop/utils/option_utils.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  var list = <DataSource>[
    DataSource.network(
        "http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4"),
    DataSource.network(
        "http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4"),
    DataSource.network("http://vfx.mtime.cn/Video/2019/03/12/mp4/190312143927981075.mp4")
  ];

  var map = <DataSource, IjkMediaController>{};

  @override
  void initState() {
    super.initState();
    for (var data in list) {
      var controller = IjkMediaController();
      OptionUtils.addDefaultOptions(controller);
      map[data] = controller;
//      controller.setDataSource(data);
    }
  }

  @override
  void dispose() {
    map.values.forEach((c) {
      c.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("currentI18n.listViewButton"),
      ),
      body: ListView.separated(
        itemBuilder: _buildItem,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 10.0,
            color: Colors.blue,
          );
        },
        itemCount: list.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return AspectRatio(
      child: VideoItem(list[index]),
      aspectRatio: 1280 / 720,
    );
  }
}

class VideoItem extends StatefulWidget {
  final DataSource dataSource;

  VideoItem(this.dataSource);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  IjkMediaController controller;

  var isInit = false;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = IjkMediaController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      Widget stateButton = IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: _play,
        color: Colors.white,
      );

      if (isLoading) {
        stateButton = CircularProgressIndicator();
      }

      var center = Center(
        child: Container(
          width: 60.0,
          height: 60.0,
          child: stateButton,
        ),
      );

      return Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          center,
        ],
      );
    }

    var ijkPlayer = IjkPlayer(
      mediaController: controller,
      controllerWidgetBuilder: _buildControllerWidget,
    );
    return ijkPlayer;
  }

  void _play() async {
    setState(() {
      isLoading = true;
    });
    await controller.setDataSource(widget.dataSource, autoPlay: true);
    await controller.pauseOtherController();
    setState(() {
      isLoading = false;
      isInit = true;
    });
  }

  Widget _buildControllerWidget(IjkMediaController controller) {
    return DefaultIJKControllerWidget(
      controller: controller,
      verticalGesture: false,
    );
  }
}

class PauseOtherNotification extends Notification {}
