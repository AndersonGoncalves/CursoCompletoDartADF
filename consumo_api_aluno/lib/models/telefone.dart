import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

  //passo 1 da Serialização
  //metodo que pega nosso objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  //passo 2 da Serialização
  //metodo que pega um Map<String, dynamic> e transforma em um json pelo pacote dart:convert (jsonEncode)
  String toJson() => jsonEncode(toMap());

  //passo 1 da Deserialização
  //construtor nomeado que recebe um Map<String, dynamic> e cria o ojeto
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  //passo 2 da Deserialização
  //construtor nomeado que recebe um json do tipo String e transforma em um objeto pelo pacote dart:convert (jsonDecode)
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));
}
