import 'package:clean_architecture_template/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:clean_architecture_template/features/auth/presentaion/widgets/custom_text_field.dart';
import 'package:clean_architecture_template/features/auth/presentaion/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static router() => MaterialPageRoute(builder: (ctx) => const SignInScreen());
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void singnInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // const SizedBox(height: 200),
                  const Text(
                    'Sign In.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    isObsecured: true,
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    buttonText: 'Sign In',
                    onPressed: () {
                      singnInUser();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // navigate to sign in screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 245, 76, 132),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
