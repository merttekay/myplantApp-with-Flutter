import 'package:bitirme/details.dart';
import 'package:bitirme/provider/plant_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import 'model/plant.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacer(),
          Expanded(
            child: Text(
              'Bitkilerim',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: context.watch<PlantProvider>().myPlantList.length,
                itemExtent: 150,
                itemBuilder: (_, index) {
                  final item = context.read<PlantProvider>().myPlantList[index];
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(color: Colors.red),
                    key: Key(item.toString()),
                    onDismissed: (direction) {
                      context.read<PlantProvider>().removePlant(
                          context.read<PlantProvider>().myPlantList[index]);
                    },
                    child: GestureDetector(
                      onTap: () {
                        var plant =
                            context.read<PlantProvider>().myPlantList[index];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DetailScreen(plant: plant)));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color((math.Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt())
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(context
                                              .read<PlantProvider>()
                                              .myPlantList[index]
                                              .imagePath))),
                                ),
                                Text(
                                  context
                                      .read<PlantProvider>()
                                      .myPlantList[index]
                                      .name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
