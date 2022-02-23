import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';

import '../../shared/widget/boleto_list/boleto_list.dart';

class MeusBoletosPage extends StatelessWidget {
  const MeusBoletosPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text("Meus boletos", style: AppTextStyles.titleBoldHeading,),
        ),
        BoletoList(),

      ]),
    );
  }
}