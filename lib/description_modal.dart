import 'package:flutter/material.dart';
import 'package:marvel/character_model.dart';
import 'package:marvel/marvel_service.dart';

class DescriptionModal extends StatefulWidget {
  const DescriptionModal({Key? key, required this.index}) : super(key: key);
  final index;

  @override
  _DescriptionModalState createState() => _DescriptionModalState();
}

class _DescriptionModalState extends State<DescriptionModal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15),
            child: const Text(
              'Sobre o personagem',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              left: 40,
              right: 40,
            ),
            child: FutureBuilder<List<CharacterModel>>(
              future: MarvelService().getCharacters(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    snapshot.data![widget.index].description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
