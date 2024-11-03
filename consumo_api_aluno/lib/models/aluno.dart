import 'dart:convert';
import 'package:consumo_api_aluno/models/curso.dart';
import 'package:consumo_api_aluno/models/endereco.dart';

class Aluno {
  int id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<Curso> cursos;
  Endereco endereco;

  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.cursos,
    required this.endereco,
  });

  //passo 1 da Serialização
  //metodo que pega nosso objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'nomeCursos': nomeCursos,
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
      'endereco': endereco.toMap(),
    };

    if (idade != null) {
      map['idade'] = idade;
    }

    return map;
  }

  //passo 2 da Serialização
  //metodo que pega um Map<String, dynamic> e transforma em um json pelo pacote dart:convert (jsonEncode)
  String toJson() => jsonEncode(toMap());

  //passo 1 da Deserialização
  //construtor nomeado que recebe um Map<String, dynamic> e cria o ojeto
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      idade: map['idade'],
      //List<dynamic> não é uma lista de List<String>
      nomeCursos: List<String>.from((map['nomeCursos'] ??
          <String>[])), //ou map['nomeCursos'].cast<String>()
      cursos: map['cursos']
              ?.map<Curso>((cursoMap) => Curso.fromMap(cursoMap))
              .toList() ??
          <Curso>[],
      endereco: Endereco.fromMap(map['endereco'] ?? <String, dynamic>{}),
    );
  }

  //passo 2 da Deserialização
  //construtor nomeado que recebe um json do tipo String e transforma em um objeto pelo pacote dart:convert (jsonDecode)
  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Aluno: $nome($id)';
  }
}
