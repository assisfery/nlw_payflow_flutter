import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController
{
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;

  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
      
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  Future<void> addBoleto() async{
    final form = formKey.currentState;

    if(form!.validate())
    {
      saveBoleto();
    }
  }

  Future<void> saveBoleto() async{
    try
    {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList("boletos") ?? <String>[];
      boletos.add(model.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    }
    catch(e){
      print(e);
    }
  }

  void onChange({String? name, String? dueDate, double? valor, String? barcode})
  {
    model = model.copyWith(name: name, dueDate: dueDate, valor: valor, barcode: barcode);
  }

}