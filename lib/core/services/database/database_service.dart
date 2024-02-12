import 'package:shared_preferences/shared_preferences.dart';

abstract class DatabaseService {
  Future<T?> get<T>(String key);
  Future<void> save<T>(String key, T value);
}

class SharedPrefDatabaseService implements DatabaseService {
  SharedPrefDatabaseService({
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  Future<T?> get<T>(String key) async {
    try {
      final value = prefs.get(key) as T?;
      return value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> save<T>(String key, T value) async {
    try {
      bool isSuccess;
      switch (value.runtimeType) {
        case int:
          isSuccess = await prefs.setInt(key, value as int);
          break;
        case double:
          isSuccess = await prefs.setDouble(key, value as double);
          break;
        case bool:
          isSuccess = await prefs.setBool(key, value as bool);
          break;
        case String:
          isSuccess = await prefs.setString(key, value as String);
          break;
        default:
          isSuccess = await prefs.setString(key, value.toString());
      }
      if (!isSuccess) {
        throw Exception('Operation Was Not Successfull');
      }
    } catch (e) {
      rethrow;
    }
  }
}
