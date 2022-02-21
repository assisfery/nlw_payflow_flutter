import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';

import '../set_label_buttons/set_label_buttons.dart';

class AppBottomSheet extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;

  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  final String title;
  final String subTitle;

  const AppBottomSheet(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.shape,
        child: Column(children: [
          Expanded(
              child: Container(
            color: Colors.black.withOpacity(0.6),
          )),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text.rich(
                TextSpan(
                    text: title,
                    style: AppTextStyles.buttonBoldHeading,
                    children: [
                      TextSpan(
                          text: "\n$subTitle",
                          style: AppTextStyles.buttonHeading)
                    ]),
                textAlign: TextAlign.center),
          ),
          Container(
            height: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            primaryLabel: primaryLabel,
            primaryOnPressed: primaryOnPressed,
            enablePrimaryColor: true,
            secondaryLabel: secondaryLabel,
            secondaryOnPressed: secondaryOnPressed,
          )
        ]),
      ),
    );
  }
}
