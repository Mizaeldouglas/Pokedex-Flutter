import 'package:flutter/material.dart';
import 'package:pokedex_simples_flutter/modules/details/pages/widgets/detailsHead_widgets.dart';
import 'package:pokedex_simples_flutter/shared/core/app_fonts.dart';

class DetailsPage extends StatefulWidget {
  final int heroTag;
  final dynamic pokemonDetail;
  final Color color;

  const DetailsPage(
      {Key? key,
      required this.heroTag,
      this.pokemonDetail,
      required this.color})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DetailsWidgets(
              color: widget.color,
              heroTag: widget.heroTag,
              pokemonDetail: widget.pokemonDetail,
            ),
            _buildDetails()
          ],
        ),
      )),
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
