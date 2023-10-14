import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UsuariosTable extends StatefulWidget {
  final List<Map> usuarios;
  final Function(Map) onDelete;
  final Function(Map) onReSend;

  const UsuariosTable({
    Key? key,
    required this.usuarios,
    required this.onDelete,
    required this.onReSend,
  }) : super(key: key);

  @override
  State<UsuariosTable> createState() => _UsuariosTableState();
}

class _UsuariosTableState extends State<UsuariosTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 16,
      columns: const [
        DataColumn(
          label: Text("Nome"),
        ),
        DataColumn(
          label: Text("Area"),
        ),
        DataColumn(
          label: Text("Entrou em"),
        ),
        DataColumn(
          label: Text("Ações"),
        ),
      ],
      source: _Source(
        widget.usuarios,
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
          Text(data['nome']),
        ),
        DataCell(
          Text(data['area']),
        ),
        DataCell(
          Text(DateFormat('dd/MM/yyyy HH:mm').format(data['entrou_em'])),
        ),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                onReSend(data);
              },
              tooltip: "Repetir",
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                onDelete(data);
              },
              tooltip: "Remover",
              icon: const Icon(Icons.block),
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
