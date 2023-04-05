// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:flutter_burclar/model/burc_detay.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => BurcDetay(secilenBurc: listelenenBurc))));
        },
        leading: Image.asset("images/" + listelenenBurc.burcKucukResim),
        title: Text(listelenenBurc.burcAdi),
        subtitle: Text(listelenenBurc.burcTarihi),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
