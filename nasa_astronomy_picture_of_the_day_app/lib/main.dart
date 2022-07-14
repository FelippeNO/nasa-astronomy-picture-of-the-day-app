import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'global_module.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: GlobalModule(),
      child: MaterialApp.router(
        title: 'Nasa Astronomy Picture Of The Day',
        theme: ThemeData(useMaterial3: true),
        supportedLocales: const [Locale('en', '')],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
