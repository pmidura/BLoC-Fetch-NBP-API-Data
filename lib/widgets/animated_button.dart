import 'package:animations/animations.dart';
import 'package:bloc_fetch_api_data/repos/bid_ask_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/api_bloc/api_bloc.dart';
import '../repos/mid_repo.dart';
import '../screens/details_screen.dart';

Widget animatedButton(String currencyName) => OpenContainer(
  closedColor: const Color(0xFF171717),
  middleColor: const Color(0xFF171717),
  openColor: const Color(0xFF171717),
  transitionDuration: const Duration(milliseconds: 500),
  transitionType: ContainerTransitionType.fadeThrough,
  openBuilder: (_, __) => BlocProvider(
    create: (context) => ApiBloc(MidRepo(), BidAskRepo())..add(
      FetchDataEvent(
        currency: currencyName,
      ),
    ),
    child: DetailsScreen(
      currencyName: currencyName,
    ),
  ),
  closedBuilder: (_, __) => Container(
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.symmetric(horizontal: 25.0),
    decoration: BoxDecoration(
      color: Colors.grey[350],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: Text(
        currencyName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 1.0,
        ),
      ),
    ),
  ),
);
