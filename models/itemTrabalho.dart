

class ItemTrabalho {
  final int _id;
  final String? _titulo;
  int get id => _id;
  String? get titulo => _titulo;
  ItemTrabalho({
    required int id,
    String? titulo,
  }) : _id = id, _titulo = titulo;



void exibirResumo () {
  print('$_id - $_titulo');
}

}