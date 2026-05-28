import 'data/dadosTarefa.dart';
import 'models/tarefa.dart';


void main() {
  List<Tarefa> tarefas = dadosTarefas.map((map) => Tarefa.fromMap(map)).toList();

  for (var tarefa in tarefas) {
    tarefa.exibirResumo();
  }
}