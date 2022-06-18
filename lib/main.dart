import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinehub/core/config/app_config.dart';
import 'package:cinehub/core/constants/app_defaults.dart';
import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/core/design_system/app_theme.dart';
import 'package:cinehub/core/inject/inject.dart';
import 'package:cinehub/layers/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: AppConfig.envFileName);
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: AppTheme.dark(),
      home: const HomePage(movieId: AppDefaults.initialMovieId),
    );
  }
}
