import 'dart:convert';

import 'package:consumo_api_aluno/models/cidade.dart';
import 'package:consumo_api_aluno/models/telefone.dart';

class Endereco {
  String rua;
  int numero;
  String cep;
  Cidade cidade;
  Telefone telefone;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  //passo 1 da Serialização
  //metodo que pega nosso objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'CEP': cep,
      'cidade': cidade.toMap(),
      'telefone': telefone.toMap(),
    };
  }

  //passo 2 da Serialização
  //metodo que pega um Map<String, dynamic> e transforma em um json pelo pacote dart:convert (jsonEncode)
  String toJson() => jsonEncode(toMap());

  //passo 1 da Deserialização
  //construtor nomeado que recebe um Map<String, dynamic> e cria o ojeto
  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      cep: map['CEP'] ?? '',
      cidade: Cidade.fromMap(map['cidade'] ?? <String, dynamic>{}),
      telefone: Telefone.fromMap(map['telefone'] ?? <String, dynamic>{}),
    );
  }

  //passo 2 da Deserialização
  //construtor nomeado que recebe um json do tipo String e transforma em um objeto pelo pacote dart:convert (jsonDecode)
  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));
}
