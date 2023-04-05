// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

//constructor 1 ke zçalışırken build birden fazla kez çalışır.
// initalzed etmezsen başına "late" yaz.
//anlık olarak değişen bir şey varsa orada stateful kullanılır.

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.pink;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarRengibiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                  "images/" + widget.secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover),
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(widget.secilenBurc.burcDetay),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appBarRengibiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/" + widget.secilenBurc.burcBuyukResim),
    );
    appBarRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
