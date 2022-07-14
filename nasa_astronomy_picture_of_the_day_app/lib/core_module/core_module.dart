import 'package:flutter_modular/flutter_modular.dart';
import 'data/gateways/core_gateway.dart';
import 'data/repositories/core_repository.dart';
import 'domain/services/get_pictures_of_the_day_list_service.dart';
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

    Bind.singleton((i) => GetPicturesOfTheDayListFromDateService(i()), export: true),

    /// ------------------------------- State ---------------------------------

    Bind.singleton((i) => HomeViewController(i()), export: true),
  ];
}
