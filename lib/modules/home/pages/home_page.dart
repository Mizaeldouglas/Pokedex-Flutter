import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_simples_flutter/modules/home/controllers/home_controller.dart';
import 'package:pokedex_simples_flutter/modules/home/models/pokemons_model.dart';
import 'package:pokedex_simples_flutter/shared/core/app_fonts.dart';
import 'package:pokedex_simples_flutter/shared/core/app_palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  PokemonsModel? pokedex;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final data = await controller.getPokemonsLIst();
    setState(() {
      pokedex = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 80,
                child: Center(child: Image.asset("assets/images/logo.png")),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: pokedex != null
                    ? _buildGrid()
                    : const Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildGrid() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        itemCount: pokedex!.pokemon!.length,
        itemBuilder: (BuildContext context, int index) {
          String type = pokedex!.pokemon![index].type![0].toString();
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.backgroundColor(type),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            pokedex!.pokemon![index].name.toString(),
                            style: AppFonts.subtileWhite,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: AppPalette.black.withOpacity(0.5)),
                                child: Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: Text(
                                    pokedex!.pokemon![index].type![0]
                                        .toString(),
                                    style: AppFonts.subtitleSmallWhite,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                height: 90,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: Image.asset(
                                        'assets/images/pokebola.png',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Hero(
                                        tag: index,
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          imageUrl:
                                              pokedex!.pokemon![index].img ??
                                                  '',
                                          height: 90,
                                          width: 70,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Modular.to.pushNamed('/details/', arguments: {
                      'heroTag': index,
                      'pokemonDetail': pokedex!.pokemon![index],
                      'color': controller.backgroundColor(type)
                    });
                  },
                ),
              ),
            ],
          );
        });
  }
}
