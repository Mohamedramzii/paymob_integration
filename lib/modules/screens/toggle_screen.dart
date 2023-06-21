import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_trial/cubit/cubit/payment_cubit.dart';
import 'package:paymob_trial/modules/screens/refCodeScreen.dart';
import 'package:paymob_trial/modules/screens/webview.dart';

import '../../core/network/constants.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PaymentCubit(),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentgetGetRefCodeSuccessState) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RefCodeScreen(),
              ));
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<PaymentCubit>(context);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cubit.getRefCode();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black87, width: 2.0),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(AppImages.refCodeImage),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Payment with Ref code',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              VisaScreenWebView(url: NetworkConstants.viseURl),
                        ));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black, width: 2.0),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(AppImages.visaImage),
                            ),
                            Text(
                              'Payment with visa',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
