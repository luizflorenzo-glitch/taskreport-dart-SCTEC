import 'itemTrabalho.dart';

class Tarefa extends ItemTrabalho {
  final String? _responsavel;
  final String? _status; 
  final String? _prioridade;
  final double? _valor;
  final int? _horas;
  String? get responsavel => _responsavel;
  String? get status => _status; 
  String? get prioridade => _prioridade;
  double? get valor => _valor;
  int? get horas => _horas;
  Tarefa ({
    required int id,
    String? titulo,
    String? responsavel,
    String? status,
    String? prioridade,
    double? valor,
    int? horas,
  }) : _responsavel = responsavel, _status = status, _prioridade = prioridade, _valor = valor, _horas = horas, super(id: id, titulo: titulo);

  @override
  void exibirResumo() {
    print('ID: $id - Título: $titulo - Responsável: $responsavel - Status: $status - Prioridade: $prioridade - Valor: ${valor != null ? 'R\$ ${valor!.toStringAsFixed(2)}' : 'N/A'} - Horas: ${horas != null ? horas.toString() : 'N/A'}');
  }
factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      titulo: map['titulo']?.toString().trim() ?? 'Sem título',
      responsavel: map['responsavel']?.toString().trim() ?? 'Não Informado',
      status: map['status']?.toString().trim() ?? 'Sem status',
      prioridade: map['prioridade']?.toString().trim() ?? 'Sem prioridade',
      valor: map['valor'] != null ? double.tryParse(map['valor'].toString().replaceAll('R\$', '').replaceAll(',', '.').replaceAll(' ', '')) : null,
      horas: int.tryParse(map['horas']?.toString() ?? '0') ?? 0,
    );
  }
}

