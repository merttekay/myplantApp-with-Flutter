import 'package:bitirme/model/plant.dart';
import 'package:bitirme/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum PlantState { Idle, Busy }

class PlantProvider extends ChangeNotifier {
  List<Plant> myPlantList = [];

  bool _alarmIsOpen;

  bool get alarmIsOpen => _alarmIsOpen;
  set alarmIsOpen(bool value) {
    _alarmIsOpen = value;
    if (value) {
      Fluttertoast.showToast(msg: "Alarm aktif edildi");
    } else {
      Fluttertoast.showToast(msg: "Alarm kapatıldı");
    }
    notifyListeners();
  }

  PlantState _state;

  PlantState get state => _state;
  set state(PlantState value) {
    _state = value;
    notifyListeners();
  }

  PlantProvider() {
    alarmIsOpen = false;
    state = PlantState.Idle;
    initPlants();
  }

  void initPlants() async {
    state = PlantState.Busy;
    myPlantList = await CacheManager.instance.getPlants();
    state = PlantState.Idle;
  }

  bool addPlant(Plant plant) {
    if (!myPlantList.contains(plant)) {
      myPlantList.add(plant);
      CacheManager.instance.setPlants(myPlantList);
      notifyListeners();
      return true;
    }

    return false;
  }

  bool removePlant(Plant plant) {
    myPlantList.remove(plant);
    CacheManager.instance.setPlants(myPlantList);
    notifyListeners();
    return true;
  }
}
