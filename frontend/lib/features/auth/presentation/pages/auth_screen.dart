import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../../../home/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    const bgColor = Color(0xFFFDF6FB); // soft background

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Campus go",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const Text("explore ,connect ,and stay organized on campus",
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                  const SizedBox(height: 140),

                  // Tabs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isLogin = true),
                        child: Text("login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: isLogin ? Colors.black : Colors.grey)),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => setState(() => isLogin = false),
                        child: Text("sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: !isLogin ? Colors.black : Colors.grey)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),

                  if (!isLogin) ...[
                    _buildInput(nameController, "enter name", validator: (v) {
                      if (v == null || v.isEmpty) return "Name required";
                      return null;
                    }),
                    const SizedBox(height: 12),
                  ],

                  _buildInput(emailController, "enter email", validator: (v) {
                    if (v == null || !v.contains('@')) {
                      return "Valid email required";
                    }
                    return null;
                  }),
                  const SizedBox(height: 12),

                  _buildInput(passwordController, "password", obscure: true,
                      validator: (v) {
                    if (v == null || v.length < 6) return "Min 6 characters";
                    return null;
                  }),
                  const SizedBox(height: 24),

                  GestureDetector(
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) return;

                      bool success = false;

                      if (isLogin) {
                        success = await authProvider.login(
                          emailController.text,
                          passwordController.text,
                        );
                      } else {
                        success = await authProvider.register(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      }

                      if (!success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authProvider.errorMessage ??
                                "Something went wrong"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: authProvider.isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                isLogin ? "Login" : "Sign up",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  if (isLogin)
                    const Center(
                      child: Text("forget password?",
                          style: TextStyle(color: Colors.black54)),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String hint,
      {bool obscure = false, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
      ),
    );
  }
}
