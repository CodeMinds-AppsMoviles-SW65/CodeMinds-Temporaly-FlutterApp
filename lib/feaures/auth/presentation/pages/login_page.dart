import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/presentation/dimens.dart';
import 'package:flutter_project/feaures/auth/presentation/blocs/login/login_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (BuildContext context, LoginState state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(Dimens.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: Dimens.spacerLarge),
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: Dimens.spacerNormal),
                  Text(
                    'Welcome to Temporaly, please put your login credentials below to start using the app.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Dimens.spacerMedium),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimens.roundedShapeNormal),
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.spacerNormal),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimens.roundedShapeNormal),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: Dimens.spacerNormal),
                  ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      FocusScope.of(context).unfocus();
                      context
                          .read<LoginBloc>()
                          .add(LoginStarted(email, password));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          double.infinity, Dimens.buttonHeightNormal),
                    ),
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(height: Dimens.spacerNormal),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.paddingSmall),
                        child: Text(
                          'Or continue with',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  const SizedBox(height: Dimens.spacerNormal),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: Dimens.iconSizeSmall,
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.facebook,
                            color: Colors.blue),
                      ),
                      IconButton(
                        iconSize: Dimens.iconSizeSmall,
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.google),
                      ),
                      IconButton(
                        iconSize: Dimens.iconSizeSmall,
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.github,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.spacerLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register now'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          listener: (BuildContext context, LoginState state) {
            if (state is LoginFailure) {
              toastification.show(
                type: ToastificationType.error,
                description: const Text("Check your credentials"),
                autoCloseDuration: const Duration(seconds: 4),
                applyBlurEffect: true,
                alignment: Alignment.bottomCenter,
              );
            }
          },
        ),
      ),
    );
  }
}
