import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/layers/data/data_source/local/movie_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieLocalDataSourceImp implements MovieLocalDataSource {
  @override
  Future<List<int>> getFavoriteMoviesIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<int> favoriteList = [];
    for (String id in prefs.getStringList(AppStorageKeys.favorites) ?? []) {
      favoriteList.add(int.parse(id));
    }

    return favoriteList;
  }

  @override
  Future<bool> addIdToFavoriteList(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> favoriteList =
        prefs.getStringList(AppStorageKeys.favorites) ?? [];
    favoriteList.add(id.toString());
    return prefs.setStringList(AppStorageKeys.favorites, favoriteList);
  }

  @override
  Future<bool> removeIdFromFavoriteList(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> favoriteList =
        prefs.getStringList(AppStorageKeys.favorites) ?? [];
    favoriteList.remove(id.toString());
    return prefs.setStringList(AppStorageKeys.favorites, favoriteList);
  }
}
