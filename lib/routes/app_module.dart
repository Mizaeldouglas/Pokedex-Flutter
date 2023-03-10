import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_simples_flutter/modules/details/details_module.dart';
import 'package:pokedex_simples_flutter/modules/home/home_module.dart';
import 'package:pokedex_simples_flutter/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: SplashModule()),
        ModuleRoute("/home", module: HomeModule()),
        ModuleRoute("/details", module: DetailsModule()),
      ];
}
