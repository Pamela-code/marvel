import 'package:dio/dio.dart';
import 'package:marvel/character_model.dart';

class MarvelService {
  final url =
      'https://x8ki-letl-twmt.n7.xano.io/api:6oTFufSP/marvel_personagens';
  final dio = Dio();

  Future<List<CharacterModel>> getCharacters() async {
    final response = await dio.get(url);
    final body = response.data as List;
    final characters = body
        .map(
          (map) => CharacterModel(
              comics: map['comics'],
              description: map['description'],
              name: map['name']),
        )
        .toList();
    return characters;
  }
}
