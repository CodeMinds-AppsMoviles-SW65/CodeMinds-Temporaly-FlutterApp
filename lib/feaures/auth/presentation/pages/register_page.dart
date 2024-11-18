import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/presentation/dimens.dart';
import 'package:flutter_project/feaures/auth/presentation/blocs/register/register_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toastification/toastification.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //ola
    // osdoskjds
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (BuildContext context, RegisterState state) {
            if (state is RegisterSuccess) {
              Navigator.of(context).pop();
            } else if (state is RegisterFailure) {
                toastification.show(
                type: ToastificationType.error,
                description: const Text("Complete all field with valid data"),
                autoCloseDuration: const Duration(seconds: 4),
                applyBlurEffect: true,
                alignment: Alignment.bottomCenter,
              );
            }
          },
          builder: (BuildContext context, RegisterState state) {
            if (state is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(Dimens.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: Dimens.spacerLarge),
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: Dimens.spacerNormal),
                  Text(
                    'Please enter your details below to create your account and start enjoying the app.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: Dimens.spacerMedium),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimens.roundedShapeNormal),
                      ),
                    ),
                  ),
                     const SizedBox(height: Dimens.spacerNormal),
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
                  const SizedBox(height: Dimens.spacerNormal),
                  ElevatedButton(
                    onPressed: () {
                      final username = usernameController.text.trim();
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      FocusScope.of(context).unfocus();
                      context
                          .read<RegisterBloc>()
                          .add(RegisterStarted(username, email, password));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          double.infinity, Dimens.buttonHeightNormal),
                    ),
                    child: const Text('Sign Up',
                        ),
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
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Login now',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
