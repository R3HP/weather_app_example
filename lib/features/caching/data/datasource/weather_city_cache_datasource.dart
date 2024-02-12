// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_example/core/services/database/database_service.dart';

abstract class WeatherCityCacheDataSource {
  Future<String> getLastUsedCity();
  Future<void> setLastUseCity(String city);
}

class WeatherCityCacheDataSourceImpl implements WeatherCityCacheDataSource {
  // ignore: constant_identifier_names
  static const LAST_USED_CITY_CACHE_KEY = 'city';

  final DatabaseService databaseService;
  WeatherCityCacheDataSourceImpl({
    required this.databaseService
  });
  
  @override
  Future<String> getLastUsedCity() async {
    try {
      final city = await databaseService.get<String?>(LAST_USED_CITY_CACHE_KEY) ?? 'Rasht';
      return city;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<void> setLastUseCity(String city) async {
    try {
      await databaseService.save<String>(LAST_USED_CITY_CACHE_KEY, city);
      return;
    } catch (e) {
        throw 'Setting City Was Not Successfull';
    }
  }
}
