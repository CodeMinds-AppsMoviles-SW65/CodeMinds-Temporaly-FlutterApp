import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/data/local/app_database.dart';
import 'package:toastification/toastification.dart';
import 'core/presentation/temporaly_theme.dart'; // Ajusta el path según tu estructura
import 'feaures/about_us/presentation/home/about_us_screen.dart'; // Ajusta el path
import 'feaures/auth/presentation/blocs/login/login_bloc.dart'; // Ajusta el path
import 'feaures/auth/presentation/pages/login_page.dart'; // Ajusta el path

void main() async {
   WidgetsFlutterBinding.ensureInitialized(); 
  await AppDatabase().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: ToastificationWrapper(
        child: TemporalyTheme(
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: TemporalyTheme.lightColorScheme,
              textTheme: TemporalyTheme.textTheme,
            ),
            darkTheme: ThemeData(
              colorScheme: TemporalyTheme.darkColorScheme,
              textTheme: TemporalyTheme.textTheme,
            ),
            themeMode: ThemeMode.system,
            home: const LoginPage(),
          ),
        ),
      ),
    );
  }
}
