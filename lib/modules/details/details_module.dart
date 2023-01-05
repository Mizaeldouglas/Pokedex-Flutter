import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_simples_flutter/modules/details/pages/details_page.dart';

class DetailsModule extends Module {
  @override
  List<Bind> get binds => [];

  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => DetailsPage(
            heroTag: args.data['heroTag'],
            pokemonDetail: args.data['pokemonDetail'],
            color: args.data['color'],
          ),
        )
      ];
}
