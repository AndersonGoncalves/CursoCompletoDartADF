import 'dart:convert';

class Cidade {
  int id;
  String nome;

  Cidade({
    required this.id,
    required this.nome,
  });

  //passo 1 da Serialização
  //metodo que pega nosso objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  //passo 2 da Serialização
  //metodo que pega um Map<String, dynamic> e transforma em um json pelo pacote dart:convert (jsonEncode)
  String toJson() => jsonEncode(toMap());

  //passo 1 da Deserialização
  //construtor nomeado que recebe um Map<String, dynamic> e cria o ojeto
  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  //passo 2 da Deserialização
  //construtor nomeado que recebe um json do tipo String e transforma em um objeto pelo pacote dart:convert (jsonDecode)
  factory Cidade.fromJson(String json) => Cidade.fromMap(jsonDecode(json));
}
