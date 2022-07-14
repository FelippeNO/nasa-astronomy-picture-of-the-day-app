import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/views/home_view.dart';

class SplashModule extends Module {
  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => HomeView())];
}
