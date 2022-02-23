import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_images.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';

class BoletosInfoWidget extends StatelessWidget {
  final int size;

  const BoletosInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Image.asset(AppImages.logomini, color: AppColors.background, width: 56, height: 34,),
          Container(
            width: 1,
            height: 32,
            color: AppColors.background,
          ),
          Text("$size boletos\n cadastrados para pagar", style: AppTextStyles.captionBoldBackground,)
        ]
        ),
      ),
    );
  }
}
