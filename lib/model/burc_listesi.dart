import 'package:flutter/material.dart';
import 'package:flutter_burclar/data/strings.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:flutter_burclar/model/burc_item.dart';

// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  //bir liste tanımlayarak ad,tarih,bilgiler hep bir arada bu listenin içinde tutulsun
  late final List<Burc> tumBurclar;
  BurcListesi({super.key}) {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burçlar Listesi"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return BurcItem(listelenenBurc: tumBurclar[index]);
          }),
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          //koc1.png yazdık.
          "${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png",
          "${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png");
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
