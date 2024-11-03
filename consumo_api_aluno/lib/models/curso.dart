import 'dart:convert';

class Curso {
  int id;
  String nome;
  bool isAluno;

  Curso({
    required this.id,
    required this.nome,
    required this.isAluno,
  });

  //passo 1 da Serialização
  //metodo que pega nosso objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'isAluno': isAluno,
    };
  }

  //passo 2 da Serialização
  //metodo que pega um Map<String, dynamic> e transforma em um json pelo pacote dart:convert (jsonEncode)
  String toJson() => jsonEncode(toMap());

  //passo 1 da Deserialização
  //construtor nomeado que recebe um Map<String, dynamic> e cria o ojeto
  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      isAluno: map['isAluno'] ?? '',
    );
  }

  //passo 2 da Deserialização
  //construtor nomeado que recebe um json do tipo String e transforma em um objeto pelo pacote dart:convert (jsonDecode)
  factory Curso.fromJson(String json) => Curso.fromMap(jsonDecode(json));
}
