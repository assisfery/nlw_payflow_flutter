import 'package:flutter/material.dart';

import '../divider_vertical/divider_vertical.dart';
import '../label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;

  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(children: [
        LabelButton(label: primaryLabel, onPressed: primaryOnPressed),
        DividerVertical(),
        LabelButton(label: secondaryLabel, onPressed: secondaryOnPressed)
      ]),
    );
  }
}
