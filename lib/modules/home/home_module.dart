import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_simples_flutter/modules/home/controllers/home_controller.dart';
import 'package:pokedex_simples_flutter/modules/home/pages/home_page.dart';
import 'package:pokedex_simples_flutter/modules/home/repositories/home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind((i) => HomeRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
