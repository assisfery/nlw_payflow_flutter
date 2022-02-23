import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_text_styles.dart';

import '../../models/boleto_model.dart';

class BoletoTile extends StatelessWidget {

  BoletoModel data;
  
  BoletoTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name!, style: AppTextStyles.titleListTile,),
      subtitle: Text("Vence em " + data.dueDate!),
      trailing: Text("R\$" + data.valor.toString(), style: AppTextStyles.trailingBold,),
    );
  }
}
