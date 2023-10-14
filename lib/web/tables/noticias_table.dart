import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticiasTable extends StatefulWidget {
  final List<Map> noticias;
  final Function(Map) onDelete;
  final Function(Map) onReSend;

  const NoticiasTable({
    Key? key,
    required this.noticias,
    required this.onDelete,
    required this.onReSend,
  }) : super(key: key);

  @override
  State<NoticiasTable> createState() => _NoticiasTableState();
}

class _NoticiasTableState extends State<NoticiasTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: 16,
      columns: const [
        DataColumn(
          label: Text("Titulo"),
        ),
        DataColumn(
          label: Text("Conteúdo"),
        ),
        DataColumn(
          label: Text("Enviado em"),
        ),
        DataColumn(
          label: Text("Ações"),
        ),
      ],
      source: _Source(
        widget.noticias,
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
          SizedBox(
              width: 150,
              child: Text(
                data['titulo'],
                maxLines: 2,
              )),
        ),
        DataCell(
          SizedBox(
              width: 300,
              child: Text(
                data['descricao'],
                maxLines: 3,
              )),
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
              icon: const Icon(Icons.edit),
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
