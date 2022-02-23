import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/models/boleto_model.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow_flutter/shared/widget/boleto_list/boleto_list_controller.dart';
import 'package:nlw_payflow_flutter/shared/widget/boletos_info/boletos_info_widget.dart';

import '../../shared/widget/boleto_list/boleto_list.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 140,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ValueListenableBuilder<List<BoletoModel>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, boletos, __) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletosInfoWidget(size: boletos.length)),
              ),
            ),
          ],
        ),
      ),
      Text(
        "Meus boletos",
        style: AppTextStyles.titleBoldHeading,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BoletoList(controller: controller),
      ),
    ]);
  }
}
