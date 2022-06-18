abstract class MovieLocalDataSource {
  Future<List<int>> getFavoriteMoviesIds();

  Future<bool> removeIdFromFavoriteList(int id);

  Future<bool> addIdToFavoriteList(int id);
}
