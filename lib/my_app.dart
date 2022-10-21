import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:push_notification_fcm/core/app.dart';
import 'package:push_notification_fcm/core/locator/locator.dart' as di;
import 'package:push_notification_fcm/services/fcm/fcm_service.dart';

import 'core/navigation/app_route.dart';
import 'core/navigation/routes_mapper.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FcmService _fcmService;

  @override
  void initState() {
    di.init(GetIt.I);
    _fcmService = GetIt.I<FcmService>();
    _fcmService.registryListenMessageTapped();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoute.home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: RoutesMapper.buildRoute(),
      onGenerateRoute: (RouteSettings settings) =>
          RoutesMapper.onGenerateRoute(settings),
      navigatorKey: App.navigatorKey,
    );
  }
}
