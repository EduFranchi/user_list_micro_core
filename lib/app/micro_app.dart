import 'package:user_list_micro_core/app/micro_core_utils.dart';

abstract class MicroApp {
  String get microAppName;

  Map<String, WidgetBuilderArgs> get routes;

  void Function() get injectionsRegister;
}
