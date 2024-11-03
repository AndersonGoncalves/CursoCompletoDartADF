import 'package:consumo_api_aluno/repositories/aluno_repository.dart';

//Instalar a extensão do chrome: JSONVue
//https://chromewebstore.google.com/detail/jsonvue/chklaanhfefbnpoihckbnefhakgolnmc?hl=pt

//package do servidor rest da academia do flutter
//https://pub.dev/packages/json_rest_server

//Instalar o servidor rest da academia do flutter
//dart pub global activate json_rest_server

//Verificar a versão do servidor rest da academia do flutter
//json_rest_server version

//Rodar o servidor rest da academia do flutter
//json_rest_server run
//ou
//jrs run

//Criar o projeto
//dart create -t console-full ./consumo_api_aluno

//Criar a pasta do backend do servidor rest da academia do flutter
//json_rest_server create ./backend

//Rodar o servidor rest da academia do flutter
//http://localhost:8080/alunos/1

Future<void> main(List<String> arguments) async {
  final alunoRepository = AlunoRepository();
  final alunos = await alunoRepository.buscarTodos();
  print(alunos);

  final aluno = await alunoRepository.buscarPorId(1);
  print(aluno.nomeCursos);
}
