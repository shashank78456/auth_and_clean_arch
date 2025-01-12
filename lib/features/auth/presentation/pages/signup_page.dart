import 'package:auth_and_clean_arch/core/theme/theme.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/pages/login_page.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/utils/show_snackbar.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/widgets/auth_button.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/widgets/auth_field.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    formKey.currentState!.validate();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading) {
              return const Loader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthField(
                    hintText: "Name",
                    controller: nameController,
                  ),
                  const SizedBox(height: 15),
                  AuthField(
                    hintText: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  AuthField(
                    hintText: "Password",
                    controller: passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    buttonText: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthSignUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, LoginPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                                text: "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppPallete.gradient2,
                                      fontWeight: FontWeight.bold,
                                    ))
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
