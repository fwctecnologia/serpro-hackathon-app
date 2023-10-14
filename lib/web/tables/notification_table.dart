import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificacoesTable extends StatefulWidget {
  final List<Map> notificacoes;
  final Function(Map) onDelete;
  final Function(Map) onReSend;

  const NotificacoesTable({
    Key? key,
    required this.notificacoes,
    required this.onDelete,
    required this.onReSend,
  }) : super(key: key);

  @override
  State<NotificacoesTable> createState() => _NotificacoesTableState();
}

class _NotificacoesTableState extends State<NotificacoesTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 16,
      columns: const [
        DataColumn(
          label: Text("Titulo"),
        ),
        DataColumn(
          label: Text("Descrição"),
        ),
        DataColumn(
          label: Text("Enviado em"),
        ),
        DataColumn(
          label: Text("Ações"),
        ),
      ],
      source: _Source(
        widget.notificacoes,
        onDelete: widget.onDelete,
        onReSend: widget.onReSend,
      ),
    );
  }
}

class _Source extends DataTableSource {
  final List<Map> _data;
  final Function(Map) onDelete;
  final Function(Map) onReSend;

  _Source(
    this._data, {
    required this.onDelete,
    required this.onReSend,
  });

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    final data = _data[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(data['titulo']),
        ),
        DataCell(
          Text(data['descricao']),
        ),
        DataCell(
          Text(DateFormat('dd/MM/yyyy HH:mm').format(data['enviado_em'])),
        ),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                onReSend(data);
              },
              tooltip: "Repetir",
              icon: const Icon(Icons.replay_outlined),
            ),
            IconButton(
              onPressed: () {
                onDelete(data);
              },
              tooltip: "Remover",
              icon: const Icon(Icons.delete),
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
