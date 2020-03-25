import 'package:amap_base_location/amap_base_location.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_shop/routers/appliaction.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/previde/config_provide.dart';
import './pages/index_page.dart';
import 'config/location_manager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await IjkManager.initIJKPlayer();
  runApp(ProviderNode(child: MyApp(), providers: ConfigProvide().initProvide()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isInitPlugin = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      isInitPlugin = true;
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    AMap.init("2f8484a753a49a4d0d0083732118f57e");
    initRouter();
    LocationManager.getInstance().startLocation(context);
    if (!isInitPlugin) {
      return Container();
    }
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        theme: ThemeData(primaryColor: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: IndexPage(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
  void initRouter() {
    var router = Router.appRouter;
    Application.router = router;
    Routers.configurePage(router);
  }
}

