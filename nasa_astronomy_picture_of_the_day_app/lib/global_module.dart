import 'package:flutter_modular/flutter_modular.dart';
import 'core_module/domain/entities/picture_entity.dart';
import 'core_module/core_module.dart';

class GlobalModule extends Module {
  @override
  List<Module> imports = [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CoreModule()),
  ];
}

class CoreNavigator {
  static void toDetailedView(PictureEntity picture) {
    Modular.to.pushNamed('/detailed', arguments: picture);
  }
}
