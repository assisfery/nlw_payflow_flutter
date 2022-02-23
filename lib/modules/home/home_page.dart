import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/modules/extract/extract_page.dart';
import 'package:nlw_payflow_flutter/modules/home/home_controller.dart';
import 'package:nlw_payflow_flutter/shared/models/boleto_model.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_payflow_flutter/shared/widget/boleto_list/boleto_list.dart';
import 'package:nlw_payflow_flutter/shared/widget/boleto_tile/boleto_tile.dart';

import '../meus_boletos/meus_boletos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var controller = HomeController();

  var pages = [
    MeusBoletosPage(),
    ExtractPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: ListTile(
            title: Text.rich(TextSpan(
                text: "Olá, ",
                style: AppTextStyles.titleRegular,
                children: [
                  TextSpan(text: "Ax", style: AppTextStyles.titleBoldBackground)
                ])),
            subtitle: Text(
              "Mantenha suas contas em dia",
              style: AppTextStyles.captionShape,
            ),
            trailing: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ),

      body: pages[controller.currentPage],

      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  controller.setIndex(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: AppColors.primary,
                )),
            GestureDetector(
              onTap: (){
                print("add...");
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: controller.currentPage == 0 ? AppColors.primary : AppColors.body,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, "/barcode_scanner");
                      Navigator.pushNamed(context, "/insert_boleto");
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    )),
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.setIndex(1);
                  setState(() {});
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1 ? AppColors.primary : AppColors.body,
                ))
          ],
        ),
      ),
    );
  }
}