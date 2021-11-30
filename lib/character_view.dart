import 'package:flutter/material.dart';
import 'package:marvel/character_model.dart';
import 'package:marvel/marvel_service.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  void initState() {
    super.initState();
    final futureCharacter = MarvelService().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Personagens Marvel'),
      ),
      body: FutureBuilder<List<CharacterModel>>(
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
                            title: Text(snapshot.data![index].name),
                            onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        Text(
                                            'este personagem bç,ajdohhwvcugwvedcuwvcwdgvcywegvetdg'),
                                        Expanded(
                                          child: ListView.builder(
                                              itemBuilder: (context, index) {
                                            return Card(
                                              child: Text('HQs'),
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          );
                        }),
                  )
                ],
              );
            } else {
              return Text('deu errado');
            }
            // Column(
            //   children: [
            //     Expanded(
            //       child: ListView.builder(
            //           shrinkWrap: true,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Text(snapshot.data.toString()),
            //               onTap: () => showModalBottomSheet(
            //                   context: context,
            //                   builder: (BuildContext context) {
            //                     return Container(
            //                       child: Column(
            //                         children: [
            //                           Text(
            //                               'este personagem bç,ajdohhwvcugwvedcuwvcwdgvcywegvetdg'),
            //                           Expanded(
            //                             child: ListView.builder(
            //                                 itemBuilder: (context, index) {
            //                               return Card(
            //                                 child: Text('HQs'),
            //                               );
            //                             }),
            //                           )
            //                         ],
            //                       ),
            //                     );
            //                   }),
            //             );
            //           }),
            //     )
            //   ],
            // );
          }),
    );
  }
}
