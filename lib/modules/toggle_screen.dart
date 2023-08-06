import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/register_visa/business_logic/visa_card_cubit.dart';
import 'package:payment/modules/register_visa/view/visa_card_screen.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) =>
                              VisaCardCubit(),
                          child: const VisaCardScreen()),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Image.asset('assets/visa.jpg'),
                      const SizedBox(height: 10,),
                      const Text(
                        'Visa Card',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Code',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
