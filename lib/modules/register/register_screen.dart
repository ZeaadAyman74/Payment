import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/business_logic/payment_cubit.dart';
import 'package:payment/modules/register/widgets/custom_button.dart';
import 'package:payment/modules/register/widgets/custom_text_field.dart';
import 'package:payment/modules/toggle_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocListener<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is GetFirstTokenSuccess) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>
                  const ChooseScreen(),));
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              centerTitle: true,
              title: const Text('Payment', style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextField(
                          myController: firstNameController,
                          hint: 'First Name',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'enter first name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                          myController: lastNameController,
                          hint: 'Last Name',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'enter last name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                          myController: emailController,
                          hint: 'Email',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'enter email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                          myController: phoneController,
                          hint: 'Phone',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'enter phone';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                          myController: priceController,
                          hint: 'Price',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'enter price';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<PaymentCubit, PaymentState>(
                          builder: (context, state) {
                            if (state is GetFirstTokenLoad) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return CustomLoginButton(
                                  onPressed: () async {
                                    if(formKey.currentState!.validate()){
                                      await PaymentCubit.get(context).getFirstToken(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                          phone: phoneController.text,
                                          amount: priceController.text);
                                    }
                                  },
                                  text: 'Go To Pay');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
