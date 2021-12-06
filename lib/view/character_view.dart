import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/character_model.dart';
import '../widgets/description_modal.dart';
import '../service/marvel_service.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Personagens Marvel',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: FutureBuilder<List<CharacterModel>>(
          future: MarvelService().getCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  snapshot.data![index].img,
                                  width: 280,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data![index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return DescriptionModal(
                                index: index,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
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
    );
  }
}
