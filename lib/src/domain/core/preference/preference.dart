abstract class PreferenceContracts {
  Future<String?> getString({required String key});
  Future<bool> getBool({required String key});
  Future<int> getInt({required String key});
  Future<double> getDouble({required String key});
  Future<List<String>> getStringList({required String key});
  Future<T> getObject<T>(
      {required String key, required Function fromJsonModel});
  Future<List<T>> getListObject<T>(
      {required String key, required Function fromJsonModel});
  void setString({required String key, required String value});
  void setInt({required String key, required int value});
  void setBool({required String key, required bool value});
  void setDouble({required String key, required double value});
  void setStringList({required String key, required List<String> value});
  void setObject<T>({required String key, required T value});
  void setListObject<T>(
      {required String key, required List<T> value, required Function toJson});
}
