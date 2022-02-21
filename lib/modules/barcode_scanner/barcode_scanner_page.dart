import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow_flutter/shared/widget/divider_vertical/divider_vertical.dart';
import 'package:nlw_payflow_flutter/shared/widget/label_button/label_button.dart';

import '../../shared/widget/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Escaneia o código de barras do boleto",
          style: AppTextStyles.buttonBackground,
        ),
        backgroundColor: Colors.black,
        leading: BackButton(color: AppColors.background),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.black,
          )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
              )),
          Expanded(
              child: Container(
            color: Colors.black,
          ))
        ],
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Inserir o código do boleto",
        primaryOnPressed: (){

        },
        secondaryLabel: "Adicionar da galeria",
        secondaryOnPressed: (){
          
        },
      ),
    );
  }
}
