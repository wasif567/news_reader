abstract class INewsRepo {
  Future getNewsPopular();
  Future getNewsRecent({required DateTime sortDateTime, required String query});
  Future getNewsBusiness();
  Future getTopHeadlineNews();
  Future getWallStreetNews();
}
