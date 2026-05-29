import 'data/dadosTarefa.dart';
import 'models/tarefa.dart';


void main() {
  List<Tarefa> tarefas = dadosTarefas.map((map) => Tarefa.fromMap(map)).toList();

  for (var tarefa in tarefas) {
    tarefa.exibirResumo();
  }
  List<Tarefa> tarefasConcluidas = tarefas.where((tarefa) => tarefa.status == 'concluida').toList();
  print('\nTarefas Concluídas:'); 
  for (var tarefa in tarefasConcluidas) {
    tarefa.exibirResumo();
  }
  List<Tarefa> tarefasPendentes = tarefas.where((tarefa) => tarefa.status == 'pendente').toList();
  print('\nTarefas Pendentes:');
  for (var tarefa in tarefasPendentes) {
    tarefa.exibirResumo();
  }
  List<Tarefa> tarefasEmAndamento = tarefas.where((tarefa) => tarefa.status == 'em andamento').toList();
  print('\nTarefas em Andamento:');
  for (var tarefa in tarefasEmAndamento) {
    tarefa.exibirResumo();
  }
  List<Tarefa> tarefasCanceladas = tarefas.where((tarefa) => tarefa.status == 'cancelada').toList();
  print('\nTarefas Canceladas:');
  for (var tarefa in tarefasCanceladas) {
    tarefa.exibirResumo();
  }

  double totalValor = tarefasConcluidas.fold(0, (total, tarefa) => total + (tarefa.valor ?? 0));
  print('\nValor Total das Tarefas: $totalValor');


  double totalPendentes= tarefasPendentes.fold(0, (total, tarefa) => total + (tarefa.valor ?? 0));
  double mediaPendentes = tarefasPendentes.isNotEmpty ? totalPendentes / tarefasPendentes.length : 0;
  print('Valor Médio das Tarefas Pendentes: $mediaPendentes');

  Map<String, int> horasPorStatus = {};
  for (var tarefa in tarefas) {
    String status = tarefa.status ?? 'Sem status';
    horasPorStatus[status] = (horasPorStatus[status] ?? 0) + (tarefa.horas ?? 0);
  }
    print ('\nHoras por Status:');
    horasPorStatus.forEach((status, horas) => print('$status: $horas horas'));

  print('\nTarefas com dados incompletos');
  for (Map<String, dynamic> map in dadosTarefas) {
    if (map['titulo'] == null || map['responsavel'] == null || map['status'] == null || map['prioridade'] == null || map['valor'] == null || map['horas'] == null) {
      Tarefa tarefaIncompleta = Tarefa.fromMap(map);
      tarefaIncompleta.exibirResumo();
    }
  }
  
  Set<String> statusUnicos = {};
  for (var tarefa in tarefas) {
    statusUnicos.add(tarefa.status ?? 'Sem status');
  }
  print('\nStatus Únicos');
    for (var status in statusUnicos) {
    print(status);
  }
}  


