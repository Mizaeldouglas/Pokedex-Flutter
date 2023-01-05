import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pokedex_simples_flutter/shared/core/app_palette.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "PokeDex",
      theme: ThemeData(primarySwatch: primaryColor),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
