import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArquivoTable extends StatefulWidget {
  final List<Map> arquivos;
  final Function(Map) onDelete;
  final Function(Map) onReSend;

  const ArquivoTable({
    Key? key,
    required this.arquivos,
    required this.onDelete,
    required this.onReSend,
  }) : super(key: key);

  @override
  State<ArquivoTable> createState() => _ArquivoTableState();
}

class _ArquivoTableState extends State<ArquivoTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 16,
      columns: const [
        DataColumn(
          label: Text("Nome"),
        ),
        DataColumn(
          label: Text("Formato"),
        ),
        DataColumn(
          label: Text("Enviado em"),
        ),
        DataColumn(
          label: Text("Ações"),
        ),
      ],
      source: _Source(
        widget.arquivos,
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
          Text(data['formato']),
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
              tooltip: "Baixar",
              icon: const Icon(Icons.download),
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
