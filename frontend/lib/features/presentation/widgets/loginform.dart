import 'package:flutter/material.dart';
import "package:collage_campus/features/presentation/widgets/textformfeild.dart";

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  final formkey = GlobalKey<FormState>();
  TextEditingController? emailcontroller;
  TextEditingController? passwordcontroller;
  bool _isLogin = true;

  @override
  void dispose() {
    emailcontroller!.dispose();
    passwordcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void toggleAuthMode() {
      setState(() {
        _isLogin = !_isLogin;
      });
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!_isLogin) toggleAuthMode();
                    },
                    child: Text(
                      'login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            _isLogin ? FontWeight.bold : FontWeight.normal,
                        color: _isLogin ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      if (_isLogin) toggleAuthMode();
                    },
                    child: Text(
                      'sign up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            !_isLogin ? FontWeight.bold : FontWeight.normal,
                        color: !_isLogin ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const TextFormFeild(
                hintText: 'enter email',
                obscurText: false,
              ),
              const SizedBox(
                height: 27,
              ),
              const TextFormFeild(
                hintText: 'pasword',
                obscurText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xffD9D9D9))),
                      onPressed: () {
                        formkey.currentState!.validate();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))),
              const SizedBox(
                height: 10,
              ),
              const Center(child: Text('forget password?')),
            ],
          ),
        ),
      ),
    );
  }
}
