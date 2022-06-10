import 'package:bitirme/model/plant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  CacheManager._privateConstructor();

  static final CacheManager _instance = CacheManager._privateConstructor();

  static CacheManager get instance => _instance;

  Future<List<Plant>> getPlants() async {
    var prefs = await SharedPreferences.getInstance();
    var stringPlantList = prefs.getString('plants');
    return Plant.decode(stringPlantList ?? []);
  }

  Future<bool> setPlants(List<Plant> plants) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString('plants', Plant.encode(plants));
  }

  Future<bool> removePlant(Plant plant) async {
    var list = await instance.getPlants();
    list.remove(plant);
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString('plants', Plant.encode(list));
  }
}
