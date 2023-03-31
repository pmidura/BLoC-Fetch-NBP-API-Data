import 'package:bloc_fetch_api_data/utils/styles.dart';
import 'package:flutter/material.dart';

import '../models/mid_model.dart';
import '../models/table_details.dart';

class TableViewScreen extends StatelessWidget {
  final List<MidModel> tableMidList;

  const TableViewScreen({super.key, required this.tableMidList});

  @override
  Widget build(BuildContext context) {
    TableDetails data = TableDetails(tableMidList);

    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      body: Container(
        margin: const EdgeInsets.only(
          top: 50.0,
          bottom: 50.0,
        ),
        child: ListView(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                cardColor: const Color(0xFF171717),
                dividerColor: Colors.grey[800]!,
                dataTableTheme: DataTableThemeData(
                  dividerThickness: 1,
                  dataTextStyle: white14(),
                  headingTextStyle: white14(),
                ),
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              child: PaginatedDataTable(
                source: data,
                rowsPerPage: PaginatedDataTable.defaultRowsPerPage,
                arrowHeadColor: Colors.white,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Data',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Kurs',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
