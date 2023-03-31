import 'package:bloc_fetch_api_data/models/bid_ask_model.dart';
import 'package:bloc_fetch_api_data/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_progress_indicator/gradient_progress_indicator.dart';
import 'package:intl/intl.dart';

import '../blocs/api_bloc/api_bloc.dart';
import '../models/mid_model.dart';
import '../widgets/bid_ask_rates_list.dart';
import '../widgets/chart_widget.dart';
import '../widgets/mid_rates_table.dart';

class DetailsScreen extends StatefulWidget {
  final String currencyName;
  
  const DetailsScreen({
    super.key,
    required this.currencyName,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final df = DateFormat('dd/MM/yyyy');
  final tooltipDate = DateFormat('EEE, MMM d, yyyy', 'pl');
  
  @override
  Widget build(BuildContext context) => BlocBuilder<ApiBloc, ApiState>(
    builder: (context, state) {
      if (state is ApiLoadingState) {
        return const Center(
          child: GradientProgressIndicator(
            radius: 20,
            duration: 1,
            strokeWidth: 5,
            gradientStops: [
              0.2,
              0.8,
            ],
            gradientColors: [
              Color(0xff4338CA),
              Color(0xff6D28D9),
            ],
            child: Text(''),
          ),
        );
      } else if (state is ApiLoadedState) {
        List<MidModel> midList = state.midList;
        List<BidAskModel> bidAskList = state.bidAskList;

        return Scaffold(
          backgroundColor: const Color(0xFF171717),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          '${widget.currencyName} / PLN',
                          style: blueGrey16Bold(),
                        ),
                        ChartWidget(
                          tooltipDate: tooltipDate,
                          midList: midList,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          children: [
                            Text(
                              'Kurs średni ${widget.currencyName} w dniu ${df.format(midList.last.effectiveDate)}',
                              style: blueGrey16Bold(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: const Icon(
                                Icons.keyboard_double_arrow_down,
                                size: 30,
                                color: Colors.white70,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.65,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.grey[850]!),
                              ),
                              child: Text(
                                '${midList.last.mid} PLN',
                                style: blueGrey16Bold(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MidRatesTable(
                        midList: midList,
                      ),
                    ],
                  ),
                ],
              ),
              BidAskRatesList(
                df: df,
                bidAskList: bidAskList,
              ),
            ],
          ),
        );
      } else if (state is ApiErrorState) {
        return Center(
          child: Text(
            'Błąd pobierania danych!',
            style: blueGrey16Bold(),
          ),
        );
      }
      return Container();
    },
  );
}
