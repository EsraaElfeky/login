import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/add_product/ui/add_product.dart';
import 'package:qara/component/textformfeild.dart';
import 'package:qara/login/logic/logicCubit.dart';
import 'package:qara/login/logic/loginState.dart';
import 'package:qara/page1/pageui/uipage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Login(),
    );
  }
}

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailcontroler = TextEditingController();

  var passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.respoce != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Paggg(),
              ));
        }
        // TODO: implement listener
      },
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Stack(
              children: [
                const Image(image: AssetImage('assets/images/qara.PNG')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.2))),
                        height: 270,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                maxLines: 1,
                                'Welcome Back! please Log in To Your Account ',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              defaultTFF(
                                controller: emailcontroler,
                                lable: 'Email',
                                type: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'invalid_email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 70,
                                child: TextFormField(
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                      hintText: 'password',
                                      suffixIcon: InkWell(
                                        child: Icon(hidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onTap: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero)),
                                  controller: passwordcontroller,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.length > 10 || value.isEmpty) {
                                      return 'invalid_password';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 30,
                                child: Container(
                                  height: 50,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        debugPrint(emailcontroler.text);
                                      }
                                      ;
                                      {
                                        debugPrint(passwordcontroller.text);
                                      }
                                      ;
                                      context.read<LoginCubit>().login(
                                            emailcontroler.text,
                                            passwordcontroller.text,
                                          );
                                    },
                                    color:
                                        formkey.currentState?.validate() ?? true
                                            ? Colors.grey.shade700
                                            : Colors.red,
                                    child: const Center(
                                      child: Text(
                                        'login',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
