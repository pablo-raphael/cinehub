import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/layers/domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> genreJson) {
    return GenreModel(
      id: genreJson[AppJsonKeys.id],
      name: genreJson[AppJsonKeys.name],
    );
  }
}
