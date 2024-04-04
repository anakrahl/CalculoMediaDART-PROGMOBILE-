/*
Ana Claudia Krahl
04/04/2024
Atividade: Desenvolver um programa em Dart que permita aos usuários
calcular a média das notas de uma lista de alunos e identificar
quais alunos obtiveram notas iguais ou superiores à média calculada.
*/

import 'dart:io';

//função para calcular a média
double calcularMedia(List<Map> listaAlunos) {
  double somaNotasAlunos = listaAlunos
      .map((aluno) => aluno['notaAluno'])
      .reduce((a, b) =>
          a +
          b); //mapeando elementos com o Map e os juntando em um único valor com Reduce
  return somaNotasAlunos / listaAlunos.length; //fórmula para calcular a média
}

//função para filtrar os aprovados
List<Map> filtrarAlunosAprovados(List<Map> listaAlunos, double mediaAlunos) {
  return listaAlunos
      .where((aluno) => aluno['notaAluno'] >= mediaAlunos)
      .toList(); //listar todos os alunos onde nota seja maior que a média total
}

// Função para imprimir os resultados
void imprimirResultadosTotal(
    double mediaAlunos, List<Map> filtrarAlunosAprovados) {
  //lista os alunos acima da média a partir do filtro
  print('\nMédia das notas: $mediaAlunos\n');
  print('Alunos aprovados:');
  for (var aluno in filtrarAlunosAprovados) {
    //vai percorrer cada elemento da lista e mostrar os alunos aprovados
    print(
        'Nome: ${aluno['nomeAluno']}, Nota: ${aluno['notaAluno']}'); //imprime o nome do aluno e sua nota
  }
}

void main() {
  List<Map> listaAlunos = []; //lista para mapear os alunos

  while (true) {
    stdout.write(
        'Digite o nome do aluno ou "sair": '); //informar nomes ou sair do loop
    String nomeAluno = stdin
        .readLineSync()!; //lê as informações inseridas, assim como na 'notaAluno'
    if (nomeAluno == 'sair') {
      //se o usuário digitar "sair", o loop será interrompido
      break;
    }
    stdout.write('Informe a nota do aluno informado:'); //informar a nota
    double notaAluno = double.parse(stdin.readLineSync()!);

    listaAlunos.add({
      'nomeAluno': nomeAluno,
      'notaAluno': notaAluno
    }); //adicionar as informações à lista 'listaAlunos'
  }

  double mediaAlunos = calcularMedia(listaAlunos); //chama a função para cálculo
  List<Map> alunosAprovados = filtrarAlunosAprovados(
      listaAlunos, mediaAlunos); //lista os alunos aprovados
  imprimirResultadosTotal(mediaAlunos,
      alunosAprovados); //mostrará o resultado final com a média da turma e aprovados
}
