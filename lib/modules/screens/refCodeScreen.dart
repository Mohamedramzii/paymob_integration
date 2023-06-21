import 'package:flutter/material.dart';
import 'package:paymob_trial/core/network/constants.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You Should go to any market to pay'),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: Text(NetworkConstants.refCode ?? 'xxxx'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
