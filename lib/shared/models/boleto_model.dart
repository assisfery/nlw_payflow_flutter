import 'dart:convert';

class BoletoModel
{
  final String? name;
  final String? dueDate;
  final double? valor;
  final String? barcode;

  BoletoModel({
    this.name, this.dueDate, this.valor, this.barcode
  });
  
  BoletoModel copyWith({
  String? name,
  String? dueDate,
  double? valor,
  String? barcode
  }){
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      valor: valor ?? this.valor,
      barcode: barcode ?? this.barcode
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "dueDate": dueDate,
      "valor": valor,
      "barcode": barcode
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      valor: map['valor'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, valor: $valor, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.valor == valor &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ valor.hashCode ^ barcode.hashCode;
  }

}