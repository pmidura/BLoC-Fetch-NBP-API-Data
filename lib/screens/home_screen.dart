import 'package:bloc_fetch_api_data/utils/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/animated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF171717),
    body: Column(
      children: [
        const SizedBox(height: 50),
        Icon(
          Icons.currency_exchange,
          size: 80,
          color: Colors.grey[350],
        ),
        const SizedBox(height: 50),
        Text(
          'Witamy z powrotem, brakowało nam Ciebie!',
          style: white16(),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: const [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'Wybierz walutę',
          style: white16(),
        ),
        const SizedBox(height: 25),
        const Icon(
          Icons.keyboard_double_arrow_down,
          size: 50,
          color: Colors.white70,
        ),
        const SizedBox(height: 25),
        animatedButton('EUR'),
        const SizedBox(height: 25),
        animatedButton('USD'),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    '2023 \u00a9 Midura Patryk',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
