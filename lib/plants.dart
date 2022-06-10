import 'dart:math' as math;

import 'package:bitirme/model/plant.dart';
import 'package:bitirme/provider/plant_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class PlantsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Plant> plantList = [
    Plant(
        name: "Gül",
        imagePath: "assets/img/0.png",
        desc:
            """Kokulu güllerin çiçeklerinin taç yapraklarında uçucu yağlar, tanen, galik asit, anthosyanin ve bazı diğer maddeler bulunmaktadır. Bu yağ genellikle kozmetik ürünlerin yapımında kullanılır.
Genel olarak gül bitkisinin bileşiminde; geraniol, rodino, citronel, pektin ve nikotinamid gibi maddeler bulunmaktadır.
Çok fazla soğuk da çok fazla sıcak da güllere zarar verir. Bu nedenle ortamın normal oda sıcaklığında tutulması önerilmektedir.
Yaz aylarında çiçek açan güller kış aylarında yapraklarını dökerek dinlenme zamanına girerler.
Mayıs ve Haziran aylarında çiçek açarlar."""),
    Plant(
        name: "Ayçiçeği",
        imagePath: "assets/img/1.png",
        desc:
            """ Günebakan, Gündöndü ve Günçiçeği diye de bilinen bir yıllık bitki. Ayçiçeğinin boyu, yarım metreden dört metreye kadar varır. Kalınlığı 1 ile 4 cm arasında değişir. Ayçiçeğinin çok sağlam bir kök yapısına sahip olduğu bilinmektedir. Bu bitki kuvvetli kökleriyle toprağı sıkı sıkıya kavrar ve çok fazla besin maddesi, özellikle potasyum alır.Ayçiçeğinin yaprakları iri ve kalp şeklinde olup, renkleri açık yeşilden koyu yeşile kadar değişir. Bitkinin yaprakları, dalları ve sapı tüylüdür. Ayçiçeği saplarının içi özle doludur.
"""),
    Plant(
        name: "Kaktüs",
        imagePath: "assets/img/6.png",
        desc:
            """Kaktüs, dikenli yapısıyla bilinen genellikle çöllerde ve tropik bölgelerde yaygın olarak görülen bir bitkidir. Özel bir familyaya ait olmayan kaktüs, yaprakları ve çiçekleri diken şeklini almış bitkilerin ortak ismidir. Birçok çeşidi bulunan kaktüsün boyları 12 metreye kadar ulaşabilir. Çok fazla su ve yağış istemeyen bir yapıya sahip olan kaktüs, evlerde de rahatlıkla yetişebilir. Dikenleri bazı cinslerde zehirli olabilir.
"""),
    Plant(
        name: "Limon Ağacı",
        imagePath: "assets/img/7.png",
        desc:
            """Limon : Köken olarak limonun anavatanı Hindistan’ın doğu Himalaya bölgesidir. Anavatan olarak bilinen bu bölgede bildiğimiz limonlara rastlanılmamakta ve daha çok limon benzeri ya da melezlerine rastlanılmaktadır. Limon Akdeniz havzası ve Ortadoğu’da oluşmuş bir türdür. Limonların dağılışı ve başlıca üretim alanları en düşük sıcaklıkları -4˚C’nin üstünde olan yarı kurak ve kurak subtropik bölgeler arasında sınırlıdır. Limon genellikle kuzey ve güney yarımkürenin subtropik iklim bölgelerinde yetiştirilen bir türdür.
Limonlar 3-7 m civarında, orta büyüklükte ağaçlar oluştururlar. 8 m.’yi geçen ağaçlara da rastlanılabilmektedir
"""),
    Plant(
        name: "Deve Tabanı",
        imagePath: "assets/img/3.png",
        desc:
            """Bilimsel adı Monstera deliciosa olan bitkinin farklı adları bulunmaktadır.Bunlar: Kasırga tesisi, Meksika Ekmek Kızartması, İsviçre peynir bitkisi, Deve tabanı gibi farklı bölgelerde benzetme ve özellik yönünden verilmiş isimlerdir.
-Tanım: Deve tabanı bitkisi, bu cins içindeki kapalı bitki olarak en popüler türdür.Araceae arum ailesinin bu üyesi havadan kökleri olan, 25 ila 75 cm genişliğinde 25 ila 90 cm (10-35 inç) uzunluğunda geniş, kürklü, parlak, kalp şeklinde yapraklarla 20 metreye kadar büyüyebilen bir epifittir."""),
    Plant(
        name: "Fesleğen Ağacı",
        imagePath: "assets/img/8.png",
        desc:
            """Fesleğenlerin yetişkin haldeki boyları genelde 20 ile 60 cm arasında değişir. Açık yeşilden koyu yeşile kadar değişen renklerdeki yaprakları yumuşak olup, 1-5 cm arası uzunlukta ve 1-3 cm arası genişliktedir. Soğuk havaya karşı çok duyarlı olan fesleğen ağacı, en çok kuru ve sıcak ortamları sever"""),
    Plant(
        name: "Semizotu",
        imagePath: "assets/img/4.png",
        desc:
            """Semizotu ya da pirpirim (Portulaca oleracea), semizotugiller familyasından bir bitki olup yaprakları salata olarak, ya da ıspanak gibi pişirilerek yemeklerde kullanılan bir sebzedir. Kökeni Ortadoğu ve Hindistan olmakla birlikte dünyanın birçok bölgesinde bulunmaktadır.
"""),
    Plant(
        name: "Kurdele Çiçeği",
        imagePath: "assets/img/2.png",
        desc:
            """Klasik bir ev bitkisi olan kurdele çiçeğinin (Chlorophypum comosum) büyümesi oldukça kolaydır ve en küçük evler için bile mükemmel bir görüntü oluşturur. 
Sulamayı unutan biriyseniz sizin için en ideal bitkilerden biri kurdele çiçeğidir diyebiliriz. En iyi sonuçlar için dolaylı ışık altında yetiştirilmelidir. """),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: buildBitkilerText(),
              ),
            ),
            Expanded(
              flex: 10,
              child: GridView.count(
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(plantList.length, (index) {
                  return buildCard(index, context);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text buildBitkilerText() {
    return Text(
      'Bitkiler',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    );
  }

  Widget buildCard(int index, context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor:
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1),
                  title: Text(
                    plantList[index].name,
                    textAlign: TextAlign.center,
                  ),
                  content:
                      Text(plantList[index].desc, textAlign: TextAlign.center),
                  actions: [
                    RaisedButton(
                        color: Colors.blue.shade300,
                        onPressed: () {
                          var result = context
                              .read<PlantProvider>()
                              .addPlant(plantList[index]);
                          if (result) {
                            Fluttertoast.showToast(
                                msg: "Çiçek başarıyla eklendi",
                                backgroundColor: Colors.green.shade300);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Bu çiçek listenizde zaten bulunmaktadır",
                                backgroundColor: Colors.green.shade300);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Ekle',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            buildImage(index),
            Positioned(bottom: 10, left: 10, child: buildText(index))
          ],
        ),
      ),
    );
  }

  Container buildImage(int index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(plantList[index].imagePath))),
    );
  }

  Text buildText(int index) {
    return Text(
      plantList[index].name,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
