import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/persistence/core_shared_preferences.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/services/get_pictures_from_shared_prefs_service.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/presentation/views/home_view.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/presentation/views/picture_detailed_view.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/get_shared_preferences.dart';
import 'data/gateways/core_gateway.dart';
import 'data/repositories/core_repository.dart';
import 'domain/services/get_pictures_from_date_service.dart';
import 'presentation/controllers/home_view_controller.dart';
import 'shared/network/core_http_client.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    /// ------------------------------ Clients --------------------------------

    Bind.singleton((i) => CoreHttpClient(), export: true),

    /// ------------------------------ Shared Preferences --------------------------------

    Bind.singleton((i) => GetSharedPreferencesInstance(), export: true),
    Bind.singleton((i) => CoreSharedPreferences(i()), export: true),

    /// ------------------------------ Gateways --------------------------------

    Bind.singleton((i) => CoreGateway(i(), i()), export: true),

    /// ---------------------------- Repositories ------------------------------

    Bind.singleton((i) => CoreRepository(i(), i()), export: true),

    /// ------------------------------ Services --------------------------------

    Bind.singleton((i) => GetPicturesFromDateService(i()), export: true),
    Bind.singleton((i) => GetPicturesFromSharedPrefsService(i()), export: true),

    /// ------------------------------- State ---------------------------------

    Bind.singleton((i) => HomeViewController(i(), i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomeView()),
    ChildRoute('/detailed', child: (_, args) => PictureDetailedView(picture: args.data))
  ];
}
