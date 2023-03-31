import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../models/mid_model.dart';
import '../screens/table_view_screen.dart';

class MidRatesTable extends StatelessWidget {
  const MidRatesTable({
    super.key,
    required this.midList,
  });

  final List<MidModel> midList;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: const Color(0xFF171717),
      middleColor: const Color(0xFF171717),
      openColor: const Color(0xFF171717),
      transitionDuration: const Duration(milliseconds: 500),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (_, __) => TableViewScreen(tableMidList: midList),
      closedBuilder: (_, __) => Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.65,
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.green.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            'Pokaż tabelę kursów średnich',
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
