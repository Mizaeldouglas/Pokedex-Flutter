import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_simples_flutter/modules/splash/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Modular.get<SplashController>();
  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Image.asset('assets/images/loading_pokemon.gif'),
            Image.asset('assets/images/logo.png')
          ],
        ),
      ))),
    );
  }
}
