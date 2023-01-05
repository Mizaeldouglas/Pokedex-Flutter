import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_simples_flutter/shared/core/app_fonts.dart';
import 'package:pokedex_simples_flutter/shared/core/app_palette.dart';

class DetailsWidgets extends StatefulWidget {
  final int heroTag;
  final dynamic pokemonDetail;
  final Color color;
  const DetailsWidgets(
      {Key? key,
      required this.heroTag,
      this.pokemonDetail,
      required this.color})
      : super(key: key);

  @override
  _DetailsWidgetsState createState() => _DetailsWidgetsState();
}

class _DetailsWidgetsState extends State<DetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: widget.color,
      ),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => Modular.to.pop(context),
              icon: const Icon(Icons.chevron_left),
            ),
          ),
          Text(
            widget.pokemonDetail.name,
            style: AppFonts.titleWhite,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppPalette.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(widget.pokemonDetail.type.join(', '),
                        style: AppFonts.subtileWhite),
                  ),
                ),
                Text(
                  '#${widget.pokemonDetail.num}',
                  style: AppFonts.subtileWhite,
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/images/pokebola_details.png',
                  height: 200,
                  width: 110,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 60),
                child: Hero(
                  tag: widget.heroTag,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: widget.pokemonDetail.img,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          _buildDetailRow('Height', widget.pokemonDetail.height),
          _buildDetailRow('Weight', widget.pokemonDetail.weight),
          _buildDetailRow(
              'Spawn Chance', widget.pokemonDetail.spawnChance.toString()),
          _buildDetailRow(
              'Avg Spawns', widget.pokemonDetail.avgSpawns.toString()),
          _buildDetailRow('Spawn Time', widget.pokemonDetail.spawnTime),
          _buildDetailRow(
              'Weaknesses', widget.pokemonDetail.weaknesses.join(', ')),
          widget.pokemonDetail.prevEvolution != null
              ? _buildDetailRow(
                  'Pre Evolution', widget.pokemonDetail.prevEvolution[0].name)
              : _buildDetailRow('Pre Evolution', 'Just Hatched'),
          widget.pokemonDetail.nextEvolution != null
              ? _buildDetailRow(
                  'Next Evolution', widget.pokemonDetail.nextEvolution[0].name)
              : _buildDetailRow('Next Evolutio', 'Maxed Out'),
        ],
      ),
    );
  }

  _buildDetailRow(String label, String description) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            label,
            style: AppFonts.bodyTitle,
          ),
        ),
        Expanded(
          child: Text(
            description,
            style: AppFonts.bodyText,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
