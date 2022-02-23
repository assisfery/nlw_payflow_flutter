import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/widget/boleto_list/boleto_list_controller.dart';

import '../../models/boleto_model.dart';
import '../boleto_tile/boleto_tile.dart';

class BoletoList extends StatefulWidget {
  BoletoListController controller;
  BoletoList({Key? key, required this.controller}) : super(key: key);

  @override
  State<BoletoList> createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletosNotifier,
        builder: (_, boletos, __) =>
            Column(children: boletos.map((e) => BoletoTile(data: e)).toList()));
  }
}
