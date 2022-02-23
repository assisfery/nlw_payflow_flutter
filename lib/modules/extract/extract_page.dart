import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/models/boleto_model.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow_flutter/shared/widget/boleto_list/boleto_list_controller.dart';
import 'package:nlw_payflow_flutter/shared/widget/boletos_info/boletos_info_widget.dart';

import '../../shared/widget/boleto_list/boleto_list.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({ Key? key }) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 24,
      ),
      Text("Meus extratos", style: AppTextStyles.titleBoldHeading,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BoletoList(controller: controller),
      ),

    ]);
  }
}