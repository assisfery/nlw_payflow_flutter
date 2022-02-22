import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';

class InputText extends StatelessWidget {
  String label;
  IconData icon;

  String? initialValue;
  String Function(String?)? validator;
  TextEditingController? controller;
  void Function(String value) onChanged;

  InputText(
      {
        Key? key,
      required this.label,
      required this.icon,
      this.initialValue,
      this.validator,
      this.controller,
      required this.onChanged
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Icon(icon),
                    ),
                    Container(
                      height: 48,
                      width: 1,
                      color: AppColors.stroke,
                    )
                  ],
                )),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          )
        ],
      ),
    );
  }
}
