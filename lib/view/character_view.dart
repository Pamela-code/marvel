import 'package:flutter/material.dart';

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
        title: const Text('Personagens Marvel'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Personagem'),
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
      ),
    );
  }
}
