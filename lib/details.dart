import 'package:bitirme/provider/plant_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/plant.dart';

class DetailScreen extends StatelessWidget {
  final Plant plant;

  const DetailScreen({Key key, this.plant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                plant.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(
                  plant.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Gelişim Evresi : Tohum',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                Icon(
                  Icons.local_florist,
                  size: 84,
                  color: Colors.green.shade200,
                ),
              ],
            )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Ortalama güneş alma süresi 5-7 saattir",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.wb_sunny,
                    size: 56,
                    color: Colors.yellow.shade400,
                  ))
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Su Hatırlatıcısı', style: TextStyle(fontSize: 24)),
                  CupertinoSwitch(
                      value: context.watch<PlantProvider>().alarmIsOpen,
                      onChanged: (value) {
                        context.read<PlantProvider>().alarmIsOpen = value;
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
