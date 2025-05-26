import 'package:flutter/material.dart';
import 'package:user_list_micro_core/app/micro_app.dart';
import 'package:user_list_micro_core/app/micro_core_utils.dart';

abstract mixin class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) {
      routes.addAll(baseRoutes);
    }
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  void registerInjections() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.injectionsRegister();
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) {
      return null;
    }

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
