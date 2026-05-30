import 'data/dadosTarefa.dart';
import 'models/tarefa.dart';


void main() {
  List<Tarefa> tarefas = dadosTarefas.map((map) => Tarefa.fromMap(map)).toList();

 print('============= LISTA DE TAREFAS =============\n');
  for (Tarefa tarefa in tarefas) {
  tarefa.exibirResumo();
  }

print ('============= FILTROS =============\n');

  List<Tarefa> tarefasConcluidas = tarefas.where((tarefa) => tarefa.status == 'concluida').toList();
  print('Tarefas Concluídas:'); 
  for (Tarefa tarefa in tarefasConcluidas) {
    print('- ${tarefa.titulo}');
  }
  List<Tarefa> tarefasPendentes = tarefas.where((tarefa) => tarefa.status == 'pendente').toList();
  print('\nTarefas Pendentes:');
  for (Tarefa tarefa in tarefasPendentes) {
    print('- ${tarefa.titulo}');
  }
  List<Tarefa> tarefasEmAndamento = tarefas.where((tarefa) => tarefa.status == 'em andamento').toList();
  print('\nTarefas em Andamento:');
  for (Tarefa tarefa in tarefasEmAndamento) {
    print('- ${tarefa.titulo}');
  }
  List<Tarefa> tarefasCanceladas = tarefas.where((tarefa) => tarefa.status == 'cancelada').toList();
  print('\nTarefas Canceladas:');
  for (Tarefa tarefa in tarefasCanceladas) {
    print('- ${tarefa.titulo}');
  }

  double totalValor = tarefasConcluidas.isEmpty ? 0.0 : tarefasConcluidas.map((tarefa) => tarefa.valor ?? 0.0).reduce((a, b) => a + b);

  double totalPendentes = tarefasPendentes.isEmpty ? 0.0 : tarefasPendentes.map((tarefa) => tarefa.valor ?? 0.0).reduce((a, b) => a + b);
  double mediaPendentes = tarefasPendentes.isNotEmpty ? totalPendentes / tarefasPendentes.length : 0;
  

  Map<String, int> horasPorStatus = {};
  for (Tarefa tarefa in tarefas) {
    String status = tarefa.status ?? 'Sem status';
    horasPorStatus[status] = (horasPorStatus[status] ?? 0) + (tarefa.horas ?? 0);
  }
  
  // Identificar tarefas com dados incompletos
  List<String> tarefasIncompletas = [];
  for (Map<String, dynamic> tarefa in dadosTarefas) {
    if (tarefa['titulo'] == null || tarefa['responsavel'] == null || tarefa['status'] == null || tarefa['prioridade'] == null ||
        tarefa['valor'] == null || tarefa['horas'] == null){ tarefasIncompletas.add(' - ID: ${tarefa['id']} | ${tarefa['titulo'] ?? 'Sem título'} ' );
    }
  }
  
  // Identificar status únicos
  Set<String> statusUnicos = {};
  for (Tarefa tarefa in tarefas) {
    statusUnicos.add(tarefa.status ?? 'Sem status');
  }
  
  print('\n============= RESUMO FINAL =============\n');
  print ('Total de Tarefas analisadas: ${tarefas.length}');
  print ('Total de Tarefas Concluídas: ${tarefasConcluidas.length}');
  print ('Total de Tarefas Pendentes: ${tarefasPendentes.length}');
  print ('Total de Tarefas em Andamento: ${tarefasEmAndamento.length}');
  print ('Total de Tarefas Canceladas: ${tarefasCanceladas.length}');
  print ('Valor Total das Tarefas: R\$ ${totalValor.toStringAsFixed(2)}');
  print (tarefasPendentes.isEmpty ? 'Não há taredas pendentes para calcular média.': 'Valor Médio das Tarefas Pendentes: R\$ ${mediaPendentes.toStringAsFixed(2)}');
  print ('\nHoras por Status: ');
  horasPorStatus.forEach((status, horas) => print('- $status: $horas horas'));
  print ('\nStatus Únicos: ');
  statusUnicos.forEach((status) => print('- $status'));
  print ('\nTarefas com Dados Incompletos:');
    tarefasIncompletas.forEach((tarefa) => print(tarefa));

  DateTime dataAtual = DateTime.now();
   print('\nRelatório gerado em : ${dataAtual.day.toString().padLeft(2, '0')}/${dataAtual.month.toString().padLeft(2, '0')}/${dataAtual.year} ${dataAtual.hour.toString().padLeft(2, '0')}:${dataAtual.minute.toString().padLeft(2, '0')}:${dataAtual.second.toString().padLeft(2, '0')}\n');

}

