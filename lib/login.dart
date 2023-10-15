import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qara/component/textformfeild.dart';

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
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Stack(
            children: [
              Expanded(
                  child:
                      const Image(image: AssetImage('assets/images/qara.PNG'))),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(0.2))),
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
                                  if (value!.length > 6 || value.isEmpty) {
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
    );
  }
}