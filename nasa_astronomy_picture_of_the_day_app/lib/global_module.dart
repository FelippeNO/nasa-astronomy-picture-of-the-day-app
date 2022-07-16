import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/presentation/views/picture_detailed_view.dart';
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
