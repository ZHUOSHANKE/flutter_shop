import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/appliaction.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/previde/config_provide.dart';
import './pages/index_page.dart';

void main() {
  runApp(ProviderNode(child: MyApp(), providers: ConfigProvide().initProvide()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initRouter();
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
