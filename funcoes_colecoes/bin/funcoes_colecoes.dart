void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Anderson Gonçalves|44|Masculino',
    'Micheline Gonçalves|43|Feminino',
    'Beatriz Gonçalves|17|Feminino',
    'Esther Gonçalves|3|Feminino',
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];
  print('TODOS OS PACIENTES:');
  pessoas.forEach(print);
  print('');

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.

  //RESPOSTAS

  //1 - Remova os pacientes duplicados e apresente a nova lista
  print('1 - Remova os pacientes duplicados e apresente a nova lista');
  final pessoasSemDuplicidade =
      pessoas.toSet().map((e) => e.split('|')).toList();
  for (var element in pessoasSemDuplicidade) {
    print(element[0]);
  }
  print('');

  //2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  print(
      '2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas');
  final mapSexo = <String, List<String>>{};
  for (var pessoa in pessoasSemDuplicidade) {
    final sexo = pessoa[2].toLowerCase();
    final listaMasculino = mapSexo['M'] ?? <String>[];
    final listaFeminino = mapSexo['F'] ?? <String>[];

    if (sexo == 'masculino') {
      listaMasculino.add(pessoa[0]);
    }

    if (sexo == 'feminino') {
      listaFeminino.add(pessoa[0]);
    }

    mapSexo['M'] = listaMasculino;
    mapSexo['F'] = listaFeminino;
  }

  print(mapSexo);

  final masculinos = mapSexo['M'] ?? <String>[];
  final femininos = mapSexo['F'] ?? <String>[];
  print('Masculinos (${masculinos.length})');
  masculinos.forEach(print);
  print('');
  print('Femininos (${femininos.length})');
  femininos.forEach(print);
  print('');

  //3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  print(
      '3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome');
  final pessoasMaiores18 = pessoasSemDuplicidade.where((p) {
    final idade = int.tryParse(p[1]) ?? 0;
    return idade > 18;
  }).toList();
  for (var e in pessoasMaiores18) {
    print(e[0]);
  }
  print('');

  //4 - Encontre a pessoa mais velha e apresente o nome dela.
  print('4 - Encontre a pessoa mais velha e apresente o nome dela.');
  final listaPessoasOrdenadas = [...pessoasSemDuplicidade];
  listaPessoasOrdenadas.sort((p1, p2) {
    final idadeP1 = int.tryParse(p1[1]) ?? 0;
    final idadeP2 = int.tryParse(p2[1]) ?? 0;
    return idadeP2.compareTo(idadeP1);
  });
  final pessoaMaisVelha = listaPessoasOrdenadas.first;
  print(
      'A pessoa mais velha é ${pessoaMaisVelha[0]} e tem ${pessoaMaisVelha[1]} anos');

  final pessoaMaisNova = listaPessoasOrdenadas.last;
  print(
      'A pessoa mais nova é ${pessoaMaisNova[0]} e tem ${pessoaMaisNova[1]} anos');
  print('');

  //EXTRA
  //! 5 - Informe a pessoa com 17 anos
  print('5 - Informe a pessoa com 17 anos');
  pessoas.toSet().map((e) => e.split('|')).forEach((item) {
    if (item.any((e) => e == '17')) {
      print('${item[0]} tem ${item[1]} anos e é do sexo ${item[2]}');
    }
  });
  print('');

  //! 6 - Informe a pessoa com 3 anos
  print('6 - Informe a pessoa com 3 anos');
  pessoasSemDuplicidade.forEach((item) {
    if (item.any((e) => e == '3')) {
      print('${item[0]} tem ${item[1]} anos e é do sexo ${item[2]}');
    }
  });
  print('');

  //! 7 - Transformar a lista em um map com os nomes e sexo em maiusculo
  print('7 - Transformar a lista em um map com os nomes e sexo em maiusculo');
  final pessoasMaiuscula = pessoas.asMap().map((key, value) {
    return MapEntry(key, value.toUpperCase());
  });
  pessoasMaiuscula.forEach((key, value) => print('$key : $value'));
  print('');
}
