import 'package:shared_preferences/shared_preferences.dart';

abstract class IGetSharedPreferencesInstance {
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}

class GetSharedPreferencesInstance implements IGetSharedPreferencesInstance {
  @override
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
