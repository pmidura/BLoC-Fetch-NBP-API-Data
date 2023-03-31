import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'mid_model.dart';

class TableDetails extends DataTableSource {
  List<MidModel> tableMidList;

  TableDetails(this.tableMidList);

  @override
  DataRow getRow(int index) {
    final df = DateFormat('dd/MM/yyyy');

    return DataRow(
      cells: [
        DataCell(Text(df.format(tableMidList.reversed.toList()[index].effectiveDate))),
        DataCell(Text('${tableMidList.reversed.toList()[index].mid} PLN')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => tableMidList.length;

  @override
  int get selectedRowCount => 0;
}
