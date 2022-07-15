import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/presentation/views/picture_detailed_view.dart';
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

    /// ------------------------------ Gateways --------------------------------

    Bind.singleton((i) => CoreGateway(i()), export: true),

    /// ---------------------------- Repositories ------------------------------

    Bind.singleton((i) => CoreRepository(i()), export: true),

    /// ------------------------------ Services --------------------------------

    Bind.singleton((i) => GetPicturesFromDateService(i()), export: true),

    /// ------------------------------- State ---------------------------------

    Bind.singleton((i) => HomeViewController(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [ChildRoute('/detailed', child: (_, args) => const PictureDetailedView())];
}
