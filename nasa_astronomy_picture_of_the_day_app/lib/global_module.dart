import 'package:flutter_modular/flutter_modular.dart';
import 'core_module.dart';
import 'splash_module.dart';

class GlobalModule extends Module {
  @override
  List<Module> imports = [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/core', module: CoreModule()),
  ];
}
