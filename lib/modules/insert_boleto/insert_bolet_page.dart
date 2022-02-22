import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow_flutter/shared/widget/input_text/input_text.dart';

import '../../shared/widget/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {

  String? barcode;
  InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final moneyController = MoneyMaskedTextController(leftSymbol: "CVE", decimalSeparator: ",");

  final dateController = MaskedTextController(mask: "00/00/0000");

  final barcodeController = TextEditingController();

  @override
  void initState()
  {
    if(widget.barcode != null) {
      barcodeController.text = widget.barcode!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93),
              child: Text(
                "Preencha os dados do boleto",
                style: AppTextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            InputText(
              label: "Nome do boleto",
              icon: Icons.description_outlined,
              onChanged: (value) {},
            ),
            InputText(
              label: "Vencimento",
              icon: FontAwesomeIcons.timesCircle,
              onChanged: (value) {},
              controller: dateController,
            ),
            InputText(
              label: "Valor",
              icon: FontAwesomeIcons.wallet,
              onChanged: (value) {},
              controller: moneyController,
            ),
            InputText(
              label: "Código",
              icon: FontAwesomeIcons.barcode,
              onChanged: (value) {},
              controller: barcodeController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () {},
      ),
    );
  }
}
