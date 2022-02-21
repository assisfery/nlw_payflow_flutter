import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:nlw_payflow_flutter/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow_flutter/shared/widget/divider_vertical/divider_vertical.dart';
import 'package:nlw_payflow_flutter/shared/widget/label_button/label_button.dart';

import '../../shared/widget/bottom_sheet/bottom_sheet.dart';
import '../../shared/widget/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {

  var controller = BarcodeScannerController();

  @override
  void initState()
  {
    controller.getAvailableCameras();
    super.initState();
  }


  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      left: true,
      top: true,
      right: true,
      bottom: true,
      child: Stack(children: [

        ValueListenableBuilder<BarcodeScannerStatus>(valueListenable: controller.statusNotifier, builder: (_, status, __){
          if(status.showCamera)
          {
            return Container(
              child: status.cameraController!.buildPreview(),
            );
          }
          else
          {
            return Container(
              
            );
          }
        },),

        RotatedBox(
          quarterTurns: 0, //1,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "Escaneia o código de barras do boleto",
                style: AppTextStyles.buttonBackground,
              ),
              backgroundColor: Colors.black,
              leading: BackButton(color: AppColors.background),
              centerTitle: true,
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
                  color: Colors.black.withOpacity(0.8),
                ))
              ],
            ),
            bottomNavigationBar: SetLabelButtons(
              primaryLabel: "Inserir o código do boleto",
              primaryOnPressed: () {},
              secondaryLabel: "Adicionar da galeria",
              secondaryOnPressed: () {},
            ),
          ),
        ),

        ValueListenableBuilder<BarcodeScannerStatus>(valueListenable: controller.statusNotifier, builder: (_, status, __){
          if(status.hasError)
          {
            return AppBottomSheet(
              title: "Não foi possível identificar um código de barras.",
              subTitle: "Tente escanear novamente ou digite o código do seu boleto.",
              primaryLabel: "Escanear novamente",
              primaryOnPressed: (){
                controller.getAvailableCameras();
              },
              secondaryLabel: "Digitar código",
              secondaryOnPressed: (){

              },
            );
          }
          else
          {
            return Container(
              
            );
          }
        },),

      ]),
    );
  }
}
