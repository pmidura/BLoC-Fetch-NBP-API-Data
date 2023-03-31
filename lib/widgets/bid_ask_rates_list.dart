import 'package:bloc_fetch_api_data/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/bid_ask_model.dart';

class BidAskRatesList extends StatelessWidget {
  const BidAskRatesList({
    super.key,
    required this.df,
    required this.bidAskList,
  });
  
  final DateFormat df;
  final List<BidAskModel> bidAskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'Lista kursów z ostatnich 30 dni'.toUpperCase(),
                style: black14Bold(),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.20),
                    ),
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kupno: ${bidAskList.reversed.toList()[index].bid}',
                            style: black12Bold(),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sprzedaż: ${bidAskList.reversed.toList()[index].ask}',
                            style: black12Bold(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data: ${df.format(bidAskList.reversed.toList()[index].effectiveDate)}',
                            style: black12Bold(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemCount: bidAskList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
