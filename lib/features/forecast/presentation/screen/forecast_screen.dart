import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_example/core/services/database/database_service.dart';
import 'package:weather_app_example/core/services/webservice/web_service.dart';

import 'package:weather_app_example/features/caching/data/datasource/weather_city_cache_datasource.dart';
import 'package:weather_app_example/features/forecast/data/datasource/weather_datasource.dart';
import 'package:weather_app_example/features/forecast/data/repository/weather_repository_impl.dart';
import 'package:weather_app_example/features/forecast/domain/usecase/get_current_weather_usecase.dart';
import 'package:weather_app_example/features/forecast/domain/usecase/get_weather_forcast_usecase.dart';
import 'package:weather_app_example/features/forecast/presentation/controller/weather_controller.dart';
import 'package:weather_app_example/features/forecast/presentation/view_model/current_weather_view_model.dart';
import 'package:weather_app_example/features/forecast/presentation/widget/search_bar.dart';

import '../view_model/forecast_weather_view_model.dart';
import '../widget/current_weather_section.dart';
import '../widget/today_hours_weather_section.dart';
import '../widget/weather_forecast_section.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  Completer<(CurrentWeatherViewModel, List<ForecastWeatherViewModel>)>
      completer = Completer();

  late final WeatherController controller;
  late final WeatherCityCacheDataSource cacheDataSource;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 33, 17, 61),
          Color.fromARGB(255, 42, 22, 76)
        ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchBar(onSearchSumbit: _submitSearch),
              FutureBuilder(
                future: completer.future,
                builder: (ctx,
                    AsyncSnapshot<
                            (
                              CurrentWeatherViewModel,
                              List<ForecastWeatherViewModel>
                            )>
                        snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  var today = snapshot.data?.$2.first;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CurrentWeatherSection(
                          currentWeatherViewModel: snapshot.data?.$1,
                          date: today?.date,
                          dayMaxTemp: today?.maxTempCelcius,
                          dayMinTemp: today?.minTempCelcius),
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Text('Today'),
                        ),
                      ),
                      TodayWeatherHoursSection(
                          todayHoursWeather: today?.hoursWeather),
                      WeatherForecastSection(
                          forecastWeatherList: snapshot.data?.$2),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _init() {
    final weatherRepository = WeatherRepositoryImpl(
        weatherDataSource:
            WeatherDataSourceImpl(webService: DioWebService(dio: Dio())));
    controller = WeatherController(
        getCurrentWeatherUsecase:
            GetCurrentWeatherUsecase(weatherRepository: weatherRepository),
        getWeatherForecastUsecase:
            GetWeatherForecastUsecase(weatherRepository: weatherRepository));
    SharedPreferences.getInstance().then((value) async {
      cacheDataSource = WeatherCityCacheDataSourceImpl(
          databaseService: SharedPrefDatabaseService(prefs: value));
      final lastUsedCity = await cacheDataSource.getLastUsedCity();
      debugPrint('last used City $lastUsedCity');
      controller.getCurrentAndForecastWeather(city: lastUsedCity).then((value) {
        setState(() {
          completer.complete(value);
        });
      }).catchError((error) {
        completer.completeError(error.toString());
      });
      return;
    });
  }

  _submitSearch(String cityName) {
    setState(() {
      completer = Completer();
    });
    controller.getCurrentAndForecastWeather(city: cityName).then((value) {
      cacheDataSource.setLastUseCity(cityName);
      completer.complete(value);
    }).catchError((error) {
      completer.completeError(error);
    });
  }
}
